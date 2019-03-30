class AddDefaultToPrivateOnUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :private_profile, :boolean, default: false
  end
end
