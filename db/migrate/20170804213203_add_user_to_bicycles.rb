class AddUserToBicycles < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycles, :user_id, :integer
  end
end
