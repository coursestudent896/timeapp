class ModelMailer < ActionMailer::Base
default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@yourdomain.com"

  default from: "rubyrailswebdev@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
 def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000.com/log_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
