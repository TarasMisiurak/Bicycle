class CreateBicycles < ActiveRecord::Migration[5.1]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.text :desc
      t.string :image_url

      t.timestamps
    end
  end
end
