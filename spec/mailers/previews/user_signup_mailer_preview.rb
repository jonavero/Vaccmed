# Preview all emails at http://localhost:3000/rails/mailers/user_signup_mailer
class UserSignupMailerPreview < ActionMailer::Preview
  def send_signup_email
    @user = User.new(:username=>'Juan Perez',:email=>'juan@gmail.com',:password=>'12345678',:password_confirmation=>'12345678',:createBy=>'jonacas',:role_id=>2)
    UserSignupMailer.send_signup_email(@user).deliver

  end
end
