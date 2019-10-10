# frozen_string_literal: true

class UserMailer < Devise::Mailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  default from: 'noreply@fakebook.com'
  default template_path: 'devise/mailer'

  def welcome(user)
    @greeting = 'Hi, we are the Fakebook guys'

    @user = user
    mail to: user.email, subject: 'Welcome to Fakebook'
  end
end
