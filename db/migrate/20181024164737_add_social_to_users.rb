class AddSocialToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
  end
end
