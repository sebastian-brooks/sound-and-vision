class UserMailer < ApplicationMailer
    default from: "st.b.dev20@gmail.com"

    def purchase_email(user, song, type)
        @user = user
        @song = song
        @type = type.to_i
        mail(to: @user.email, subject: 'Thank you for your purchase!')
    end

    def artist_purchase_notification(song, type)
        @artist = song.artist
        @song = song
        @type = type.to_i
        mail(to: @artist.email, subject: 'Nice! Someone just purchased your music!')
    end
end
