class AddCollectionToAllRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_reference :all_restaurants, :collection, null: false, foreign_key: true
  end
end
