class ContactMailer < ApplicationMailer
    def contact(data)
        @data = data
       mail(to: 'admin@admin.com' , subject: 'reservation' )
        
    end
end
