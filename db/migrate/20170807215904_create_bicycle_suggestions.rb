class CreateBicycleSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :bicycle_suggestions do |t|
      t.references :user, foreign_key: true
      t.references :bicycle, foreign_key: true

      t.timestamps
    end
  end
end
