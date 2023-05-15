class Sport < ApplicationRecord
  has_many :group_sports, dependent: :destroy
  has_many :groups, dependent: :destroy
end
