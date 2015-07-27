class AddPasswordDigestToPoets < ActiveRecord::Migration
  def change
    add_column :poets, :password_digest, :string
  end
end
