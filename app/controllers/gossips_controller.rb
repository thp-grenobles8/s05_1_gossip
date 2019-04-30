class GossipsController < ApplicationController
  def show
    @gossip = Gossip.all[(params[:id]).to_i]
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: params[:user_id])

    if @gossip.save
      redirect_to :root
      flash[:success] = "Ton potin a été ajouté !"
    else
      render :new
      flash[:danger] = "Ton potin n'est pas valide !"
    end
  end
end