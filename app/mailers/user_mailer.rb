class UserMailer < ApplicationMailer
    default from: "admin@sound-and-vision.com"

    def purchase_email(user, song)
        @user = user
        @song = song
        mail(to: @user.email, from: "purchases@sound-and-vision.com", subject: 'Thank you for your purchase!')
    end
end
