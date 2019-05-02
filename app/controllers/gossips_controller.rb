class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index]
  
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
      user_id: params[:user_id])

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
        user_id: User.find_by(first_name: 'anonymous').id
      )
      flash[:update_warning] = "Potin updated !"
      redirect_to @updated_gossip
    else
      flash[:update_warning] = "Error :( (error => #{@updated_gossip.errors.full_messages})"
      redirect_to @updated_gossip
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:warning_delete] = "Potin supprimé"
    redirect_to :root
  end


  private

  def authenticate_user
    unless logged_in?
      flash[:danger] = "Connecte toi s'il te plaît"
      redirect_to new_session_path
    end
  end

end