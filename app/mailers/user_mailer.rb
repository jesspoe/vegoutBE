class UserMailer < ApplicationMailer
  default from: 'eatoutwithvegout@gmail.com'
 
def welcome_email(invite)
  @invite = invite
  @url  = 'http://localhost:3000/signup'
  mail(to: @invite.email, subject: 'You are invited to VegOut!')
end 

end

  