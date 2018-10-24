class AddShoeSizeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shoe_size, :integer
  end
end
