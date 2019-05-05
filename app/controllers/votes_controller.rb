class VotesController < ApplicationController
  before_action :set_group, only: [:edit, :update, :show]

  def index 
    @votes = Vote.all 
    render json: @votes 
  end 

  def create 
    total = 0
    @vote = Vote.create(vote_params)
    @votes = Vote.where(:group_id => vote_params[:group_id])
    @counts = @votes.each_with_object(Hash.new(0)) { |voteObj,counts| counts[voteObj.rest_name] += 1 }
    @counts.each do |name, count| 
      total += count
    end 
    percents= @counts.transform_values {|v| ((v.to_f / total.to_f) * 100) }  
    render json: {counts: @counts,  total: total, percents: percents}
  end 


  private
 
  def vote_params
    params.require(:vote).permit(:group_id, :rest_name)
  end

end
