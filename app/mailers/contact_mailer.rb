class ContactMailer < ApplicationMailer

    def contactus(body)
        @body = body
        mail(to: 'smartwanderinginrome@gmail.com' , subject: 'New user comment')
    end

    def send_psw(psw,address,name)
        @name = name
        @password_sent = psw
        mail(to: address , subject: 'Temporary password')
        p 'Sent email to ' +address
    end
end
