class Bicycle < ApplicationRecord
  belongs_to :category
  belongs_to :user
  resourcify
end
