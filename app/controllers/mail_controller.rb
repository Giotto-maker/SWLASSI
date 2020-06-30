class MailController < ApplicationController

    def contact_us
        @message = params[:message]
        contact_mailer.contact_us(@message).deliver
    end
end
