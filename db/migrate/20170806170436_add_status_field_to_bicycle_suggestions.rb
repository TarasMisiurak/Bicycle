class AddStatusFieldToBicycleSuggestions < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycle_suggestions, :status, :integer, default: 1
  end
end
