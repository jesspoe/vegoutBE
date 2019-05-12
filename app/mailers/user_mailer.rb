class UserMailer < ApplicationMailer
  default from: 'eatoutwithvegout@gmail.com'
 
def welcome_email(invite)
  @invite = invite
  @url  = 'https://veggout.herokuapp.com/signup'
  mail(to: @invite.email, subject: 'You are invited to VegOut!')
end 

end

  