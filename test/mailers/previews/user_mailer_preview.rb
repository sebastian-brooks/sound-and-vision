# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def purchase_mail_preview
        UserMailer.purchase_email(User.last, Song.last)
    end
end
