class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: 99catsadmin@appacademy.io, subject: 'Welcome to My Awesome Site')
    end
end
