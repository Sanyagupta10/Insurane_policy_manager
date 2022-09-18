class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end

  def welcome_email(user)
    @user = user
    # @url  = 'http://example.com/login'
    mail to: @user.email, subject: 'Welcome to Insurance Manager'
  end
end
