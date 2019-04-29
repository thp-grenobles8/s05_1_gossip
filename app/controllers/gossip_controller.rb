class GossipController < ApplicationController
  def get_id
    @gossip = Gossip.all[(params[:id]).to_i]
  end
end