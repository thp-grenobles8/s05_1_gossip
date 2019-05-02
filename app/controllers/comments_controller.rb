class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create,:edit,:update,:create,:destroy]
    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(
        author_id: current_user.id,
        gossip_id: params[:gossip_id],
        content: params[:content]
      )

      if @comment.save
        redirect_to :root
        flash[:success] = "Commentaire ajouté !"
      else
        flash[:danger] = "Error :("
      end
    end


    private

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in to perform this action."
        redirect_to new_session_path
      end
  end
end
