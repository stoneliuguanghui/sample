class AddIndexToUsersRememberToken < ActiveRecord::Migration[5.2]
  def change
  	add_index :users, :remember_token
  end
end
