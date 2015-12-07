class AddRememberDigestToPoets < ActiveRecord::Migration
  def change
    add_column :poets, :remember_digest, :string
  end
end
