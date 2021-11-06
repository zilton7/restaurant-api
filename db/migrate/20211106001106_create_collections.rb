class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :vegetarian_favorites
      t.string :meat_lovers
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
