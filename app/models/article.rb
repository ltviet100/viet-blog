class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
  belongs_to :user
  delegate :username, to: :user, allow_nil: true
end
