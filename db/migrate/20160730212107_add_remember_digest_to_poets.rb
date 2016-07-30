class AddRememberDigestToPoets < ActiveRecord::Migration[5.0]
  def change
    add_column :poets, :remember_digest, :string
  end
end
