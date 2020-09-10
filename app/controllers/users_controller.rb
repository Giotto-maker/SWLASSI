class UsersController < ApplicationController

    def index
        @users = User.all
        if @users[0].nil? && !current_user.admin?
            raise CanCan::AccessDenied
        end
        authorize! :read , @users[0], :message => 'Forbidden'
    end

    def edit

        action = params[:operation]

        begin
            user = User.find(params[:id])
        rescue => error
            render html: 'No user found : ' + error.to_s, status: 404
            return
        end

        authorize! :block , user, :message => 'Forbidden'

        if action == 'block'
            if user.admin?
                render html: 'You cannot block this user'
                return
            else
                user.account_active = false
                begin
                    user.save!
                rescue => error
                    render html: 'Something went wrong in the attempt to block this user: ' + error.to_s
                    return
                end
            end

        elsif action == 'unblock'
            user.account_active = true
            begin
                user.save!
            rescue => error
                render html: 'Something went wrong in the attempt to unblock this user: ' + error.to_s
                return
            end
        end

        redirect_to '/users'
    end
end