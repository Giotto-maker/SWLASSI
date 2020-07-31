class SessionsController < ApplicationController
    def destroy 
        sign_out(current_user)
        redirect to '/homepage'
    end
end