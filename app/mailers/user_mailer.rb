class UserMailer < ApplicationMailer
    default from: "mucor.music@gmail.com"

    def sample_email(user)
        @user = user
        mail(to: @user.email, subject: 'Sample Email')
    end
end
