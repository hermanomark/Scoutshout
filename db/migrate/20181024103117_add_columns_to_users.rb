class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :nationality, :string
    add_column :users, :height, :integer
    add_column :users, :bust, :integer
    add_column :users, :waist, :integer
    add_column :users, :hips, :integer
    add_column :users, :eye_color, :string
    add_column :users, :hair_color, :string
    add_column :users, :shoe_size, :integer
  end
end
