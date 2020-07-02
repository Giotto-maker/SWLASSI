class ContactMailer < ApplicationMailer

    def contactus(body)
        @body = body
        mail(to: 'smartwanderinginrome@gmail.com' , subject: 'New user comment')
    end
end
