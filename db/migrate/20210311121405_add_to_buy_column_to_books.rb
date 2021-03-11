class AddToBuyColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :buy_link, :string
  end
end
