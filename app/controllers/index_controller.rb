class IndexController < ApplicationController
  def home
    @gossips = Gossip.all
  end
end