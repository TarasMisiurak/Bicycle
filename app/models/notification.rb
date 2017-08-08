class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: "User"
  belongs_to :bicycle_suggestion
  validates :user_id, :notified_by_id, :bicycle_id, presence: true
end
