class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_attached_file :image, default_url: "/assets/images/bg.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
