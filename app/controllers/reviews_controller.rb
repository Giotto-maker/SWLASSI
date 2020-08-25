class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def new
        user_id = current_user.id
        artwork_id = params[:id]
        vote = params[:mark]
        comment = params[:comment]

        # check is artwork has not been added by artlover and not completed yet
        begin
            artwork = Artwork.find(artwork_id)
        rescue => error
            render html: 'Error : ' + error.to_s
            return
        end
        
        if !artwork.voto || !artwork.valutazioni || !artwork.periodo || !artwork.dimensioni || !artwork.indirizzo || !artwork.latitudine || !artwork.longitudine
            raise CanCan::AccessDenied
        end

        review = Review.find_by(artwork: artwork_id , user: user_id)

        # update review
        if review
            # time constraint check
            start_time = review.updated_at
            end_time = DateTime.now()
            elapsed_sec = TimeDifference.between(start_time, end_time).in_seconds.to_i
            if elapsed_sec < 3600
                left_time = (3600 - elapsed_sec)/60
                render html: 'Still ' + left_time.to_s + ' minutes before you can update your review'
                return
            end
                
            review.valutation = vote
            review.comment = comment
            begin
                review.save!
                render html: 'Your review has been updated!'
            rescue => error
                render html: 'Something went wrong : ' + error.to_s
            end
        # create review
        else                                
            begin
                user_review = Review.new(:valutation => vote , :comment => comment, :updated_at => DateTime.now)
                user_review.user_id = user_id
                user_review.artwork_id = artwork_id
                current_user.reviews << user_review
                Artwork.find(artwork_id).reviews << user_review

                current_user.reviews_number += 1
                if current_user.reviews_number == 10
                    # make this user artlover!
                    current_user.roles_mask = 2     
                end
                current_user.save!

                render html: 'Your review has been correctly registered. Thank you!'
            rescue => error
                render html: 'Something went wrong : ' + error.to_s
            end
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        @reviews = Review.where(artwork: params[:id])
        authorize! :read , @reviews[0], :message => 'Forbidden'
    end

    def destroy
        review = Review.find(params[:review_id])
        authorize! :destroy , review, :message => 'Forbidden'
        artwork = review.artwork_id
        review.destroy
        redirect_to artwork_review_path(artwork)
    end

end
    