class CreateFavoriteBicycles < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_bicycles do |t|
      t.references :user, foreign_key: true
      t.references :bicycle, foreign_key: true

      t.timestamps
    end
  end
end
