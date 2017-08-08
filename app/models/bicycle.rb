class Bicycle < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :favorite_bicycles
  has_many :favorited_by, through: :favorite_bicycles, source: :user
  has_many :bicycle_suggestions
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :desc, presence: true

  def self.search(search)
    if search
      self.where('"name" ILIKE :search OR "desc" ILIKE :search', search: "%#{search}%")
    else
      self.all
    end
  end

  def self.filter(filter)
    if filter
      where(category_id: filter)
    end
  end
end
