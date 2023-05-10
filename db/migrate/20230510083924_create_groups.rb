class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :owner_id, null: false
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
