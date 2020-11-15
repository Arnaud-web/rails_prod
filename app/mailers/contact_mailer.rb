class ContactMailer < ApplicationMailer
    def contact(data)
        @data = data
       mail(to: @data['user']['email'] , subject: 'reservation' )
        
    end
end
