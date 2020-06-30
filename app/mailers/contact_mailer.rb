class ContactMailer < ApplicationMailer

    def contact_us
        @receiver = 'smartwanderinginrome@gmail.com'
        @message = params[:message]

        begin
            mail(to: @receiver.to_s , subject: @message.to_s)
        rescue => error
            render html: 'Cannot send email, this error has occurred : ' + error.to_s
        else
            render html: 'Your message has been delivered successfuly!'
    end
end
