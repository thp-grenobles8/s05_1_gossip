class LikesController < ApplicationController

  def create
    @like = Like.create!(
      user_id:    current_user,
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