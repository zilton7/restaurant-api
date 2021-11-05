class CreateAllRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :all_restaurants do |t|
      t.string :name
      t.datetime :opening_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end


