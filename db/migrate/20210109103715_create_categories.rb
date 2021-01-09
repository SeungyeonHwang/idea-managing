class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, id: false do |t|
      t.bigint :id, null: false, primary_key: true
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
