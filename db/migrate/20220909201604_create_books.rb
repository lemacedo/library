class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string "title"
      t.string "description"
      t.string "genre"
      t.string "author"
      t.string "publication_at"
      t.string "publisher"

      t.timestamps
    end
  end
end
