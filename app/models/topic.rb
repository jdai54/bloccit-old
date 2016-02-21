class Topic < ActiveRecord::Base
  has_many :sponsoredposts
  has_many :posts, dependent: :destroy
end
