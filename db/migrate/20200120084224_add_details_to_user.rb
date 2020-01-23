class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :admin, :float
  end
end
