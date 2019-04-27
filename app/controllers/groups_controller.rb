class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :show]

  def index 
    @groups = Group.all 
    render json: @groups 
  end 

  def create 
    @group = Group.create(group_params)
    render json: @group
  end 

  def destroy
    Group.destroy(params[:id])
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
