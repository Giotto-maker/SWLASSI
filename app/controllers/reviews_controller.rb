class ReviewsController < ApplicationController

    def new
        user_id = current_user.id
        artwork_id = params[:id]
        vote = params[:mark]
        comment = params[:comment]

        review = Review.find_by(artwork: artwork_id , user: user_id)

        if review                           # update review
            review.valutation = vote
            review.comment = comment
            begin
                review.save!
                render html: 'Your review has been updated!'
            rescue => error
                render html: 'Something went wrong : ' + error.to_s
            end
        else                                # create review
            begin
                user_review = Review.new(:valutation => vote , :comment => comment)
                user_review.user_id = user_id
                user_review.artwork_id = artwork_id
                current_user.reviews << user_review
                Artwork.find(artwork_id).reviews << user_review
                render html: 'Your review has been correctly registered. Thank you!'
            rescue => error
                render html: 'Something went wrong : ' + error.to_s
            end
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        @reviews = Review.where(artwork: params[:id])
    end

    def destroy
        review = Review.find(params[:review_id])
        artwork = review.artwork_id
        review.destroy
        redirect_to artwork_review_path(artwork)
    end

end
    