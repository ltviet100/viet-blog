class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
  belongs_to :user
  delegate :username, to: :user, allow_nil: true
  has_many :article_categories
  has_many :categories, through: :article_categories

  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
