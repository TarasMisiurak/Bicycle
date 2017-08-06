class Bicycle < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :desc, presence: true
  resourcify

  def self.search(search)
    if search
      self.where('name ILIKE ?', "%#{search}%")
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
