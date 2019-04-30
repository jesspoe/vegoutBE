class UserMailer < ApplicationMailer
  default from: 'eatoutwithvegout@gmail.com'
 
  def welcome_email
    @email = params[:email]
    @url  = 'http://localhost:3000/signup'
    mail(to: @email, subject: 'You are invited to VegOut!')
  end

end
