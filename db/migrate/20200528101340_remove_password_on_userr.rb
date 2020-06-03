class RemovePasswordOnUserr < ActiveRecord::Migration[5.2]
  def change
  	remove_column :userrs, :password, :string	
  end
end
