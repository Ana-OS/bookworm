class AddcolumntoBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :photo_url, :string
  end
end
