class Secret < ApplicationRecord
  belongs_to :user
  has_many :users, through: :likes, source: :user
  has_many :likes, dependent: :destroy
  validates :content, presence: true
end
