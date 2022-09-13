class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :genre
      t.string :age

      t.timestamps
    end
  end
end
