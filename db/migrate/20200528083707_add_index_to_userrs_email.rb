class AddIndexToUserrsEmail < ActiveRecord::Migration[5.2]
  def change
  	add_index :userrs, :email, unique: true
  end
end
