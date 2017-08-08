class BicycleSuggestion < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle
  has_many :notifications, dependent: :destroy
  #status enum [ :pending, :approved, :canceled ]
end
