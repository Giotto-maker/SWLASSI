class MailController < ApplicationController
    before_action :authenticate_user!

    def send_email
        @body = params[:message]

        begin
            ContactMailer.contactus(@body).deliver
        rescue => error
            render html: 'Cannot send email, this error has occurred : ' + error.to_s
        else
            render html: 'Your message has been delivered successfuly!'
        end
    end
end
