module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end

    #per diversificare link visibili ad un utente loggato e non 
    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
