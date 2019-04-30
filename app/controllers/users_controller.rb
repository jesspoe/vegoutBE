class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
 
  def create
    @user = User.create(user_params)
    
    if @user.valid? && invited? != nil 
      @invite = Invite.find_by(email: @user.email)
      @usergroup = UserGroup.create(group_id: @invite.group_id, user_id: @user.id)
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    elsif @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
 
  private
 
  def invited?
    @invited = Invite.find_by(email: @user.email)
  end 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end