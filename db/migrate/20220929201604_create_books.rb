class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string 'title'
      t.string 'description'
      t.string 'genre'
      t.string 'publication_at'
      t.string 'publisher'

      t.belongs_to :author

      t.timestamps
    end
  end
end
