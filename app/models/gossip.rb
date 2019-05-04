class Gossip < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: { minimum: 5 }
  validates :content, length: { maximum: 200 }
  belongs_to :user
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags
  has_many :comments
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
end
