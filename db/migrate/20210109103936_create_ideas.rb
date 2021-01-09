class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas, id: false do |t|
      t.bigint :id, null: false, primary_key: true
      t.references :category, null: false
      t.text :body, null: false

      t.timestamps
    end
    add_foreign_key :ideas, :categories, column: :id, primary_key: :id
  end
end
