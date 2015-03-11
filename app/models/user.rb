class User < ActiveRecord::Base
  has_many :jots, dependent: :destroy
  has_many :likes, through: :jots
end
