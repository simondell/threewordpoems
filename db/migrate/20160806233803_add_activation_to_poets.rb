class AddActivationToPoets < ActiveRecord::Migration[5.0]
  def change
    add_column :poets, :activation_digest, :string
    add_column :poets, :activated, :boolean, default: false
    add_column :poets, :activated_at, :datetime
  end
end
