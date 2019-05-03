class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :show]

  def index 
    @groups = Group.all 
    render json: @groups 
  end 

  def create 
    @group = Group.new(group_params)
    @group.save
    @usergroup = UserGroup.create(group_id: @group.id, user_id: current_user.id)
    render json: {group: @group, usergroup: @usergroup}
  end 

  def addUserGroup
  
   @invite = Invite.find_or_create_by(group_id: params[:group_id], email: params[:email])
   @found = User.find_by(email: params[:email])
  if @found != nil 
    @group = Group.find_by(id: params[:group_id])
    @usergroup = UserGroup.create(group_id: @group.id, user_id: @found.id)
    render json: {group: @group, usergroup: @usergroup}
  else  
    UserMailer.with(email: params[:email]).welcome_email.deliver_now
    render json: @email, status: :created
  end 
end 

  def destroy
    Group.destroy(params[:id])
    UserGroup.destroy(params[:group_id])
    Invite.destroy(params[:group_id])
    render json: @groups
  end

  def update
    @group.update(group_params)
    render json: @group
  end

  private
 
  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
