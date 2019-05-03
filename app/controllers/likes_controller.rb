class LikesController < ApplicationController

  def create
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    @like = Like.create!(
      user_id:    current_user.id,
      gossip_id:  params[:gossip],
      comment_id: params[:comment]
    )
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find(params[:id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end