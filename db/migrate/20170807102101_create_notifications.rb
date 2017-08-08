class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :notified_by
      t.references :bicycle_suggestion, foreign_key: true

      t.timestamps
    end
  end
end
