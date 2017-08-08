class AddFieldsToBicycleSuggestions < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycle_suggestions, :name, :string
    add_column :bicycle_suggestions, :desc, :text
    add_column :bicycle_suggestions, :image_url, :string
    add_column :bicycle_suggestions, :category_id, :integer
    add_column :bicycle_suggestions, :status, :integer, default: 0
  end
end
