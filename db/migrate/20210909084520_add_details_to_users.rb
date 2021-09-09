class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :bike, :string
    add_column :users, :profile, :text
  end
end
