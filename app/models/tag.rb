class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, dependent: :destroy
end
