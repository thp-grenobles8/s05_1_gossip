module GossipsHelper
  def user_like(gossip, user)
    if user
      Like.find_by(
        gossip: gossip,
        user:   user
      )
    end
  end
end