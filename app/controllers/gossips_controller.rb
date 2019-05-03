class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new]
  before_action :gossip_author, only: [:create, :edit, :update, :destroy]

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.find_by(gossip_id: params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(
      title:   params[:title],
      content: params[:content],
      user_id: current_user.id)

    if @gossip.save
      redirect_to :root
      flash[:success] = "Ton potin a été ajouté !"
    else
      render :new
      flash[:danger] = "Ton potin n'est pas valide !"
    end
  end

  def edit
    @updated_gossip = Gossip.find(params[:id])
  end

  def update
    @updated_gossip = Gossip.find(params[:id])
    if @updated_gossip.update(
        title: params[:title],
        content: params[:content],
        user_id: current_user.id
      )
      flash[:success] = "Potin updated !"
      redirect_back(fallback_location: root_path)

    else
      flash[:danger] = "Error :( (error => #{@updated_gossip.errors.full_messages})"
      redirect_to @updated_gossip
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = "Potin supprimé"
    redirect_to :root
  end

  def is_owner?
    @gossip = Gossip.find(params[:id])
    true if @gossip.user == current_user 
  end

  private

  def authenticate_user
    unless logged_in?
      flash[:danger] = "Connecte toi s'il te plaît"
      redirect_to new_session_path
    end
  end

  def gossip_author
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user_id
      flash[:danger] = "Ce gossip ne t'appartient pas !"
      redirect_to :root
    end
  end

end