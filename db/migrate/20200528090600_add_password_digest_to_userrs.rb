class AddPasswordDigestToUserrs < ActiveRecord::Migration[5.2]
  def change
    add_column :userrs, :password_digest, :string
    add_column :userrs, :password, :string	
  end
end
