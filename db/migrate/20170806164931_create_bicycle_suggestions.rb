class CreateBicycleSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :bicycle_suggestions do |t|

      t.timestamps
    end
  end
end
