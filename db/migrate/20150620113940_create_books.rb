class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.integer :quentity_books

      t.timestamps null: false
    end
  end
end
