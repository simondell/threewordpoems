class AddPasswordDigestToPoets < ActiveRecord::Migration[5.0]
  def change
    add_column :poets, :password_digest, :string
  end
end
