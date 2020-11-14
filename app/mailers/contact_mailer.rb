class ContactMailer < ApplicationMailer
    def contact(hotel)
        @hotel = hotel
       mail(to: 'a@a.com' , subject: 'mIL' )
        
    end
end
