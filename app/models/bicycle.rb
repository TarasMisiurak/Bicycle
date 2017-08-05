class Bicycle < ApplicationRecord
  belongs_to :category
  belongs_to :user
  resourcify

  def self.filter(filter)
    if filter
      where(category_id: filter)
    end
  end
end
