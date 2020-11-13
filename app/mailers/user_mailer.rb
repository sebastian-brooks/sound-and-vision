class UserMailer < ApplicationMailer
    default from: "st.b.dev20@gmail.com"

    def purchase_email(user, song)
        @user = user
        @song = song
        mail(to: @user.email, subject: 'Thank you for your purchase!')
    end
end
