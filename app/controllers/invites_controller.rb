class InvitesController < ApplicationController
  before_action :set_group, only: [:edit, :update, :show]

  def index 
    @invites = Invite.all 
    render json: @invites 
  end 

  def create 
    @invite = Invite.find_or_create_by(invite_params)
    render json: @invite
  end 

  def destroy
    Invite.destroy(params[:id])
    render json: @invites
  end

  def update
    @invite.update(invite_params)
    render json: @invite
  end

  private
 
  def invite_params
    params.require(:invite).permit(:group_id, :email)
  end

  def set_invite
    @invite = Invite.find(params[:id])
  end
end
