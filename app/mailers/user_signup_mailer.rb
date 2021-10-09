class UserSignupMailer < ApplicationMailer
  default :from => 'ing.jonacas@gmail.com'
  def send_signup_email(user)
    @user = user
    mail(
        :to => @user.email,
        :subject => 'Welcome to Vaccmed!'
    )
  end

  def send_password (user)
    @user = user
    mail(
        :to => @user.email,
        :subject => 'Cambio de contraseña!'
    )
  end
end
