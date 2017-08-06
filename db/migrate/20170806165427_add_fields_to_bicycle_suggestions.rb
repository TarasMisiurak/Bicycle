class AddFieldsToBicycleSuggestions < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycle_suggestions, :name, :string
    add_column :bicycle_suggestions, :desc, :text
    add_column :bicycle_suggestions, :image_url, :string
    add_column :bicycle_suggestions, :user_id, :integer
    add_column :bicycle_suggestions, :bicycle_id, :integer
  end
end
