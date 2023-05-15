class Group < ApplicationRecord
  has_many :group_sports, dependent: :destroy
  had_many :sport, through: :group_sports
end
