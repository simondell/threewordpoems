class AddResetToPoets < ActiveRecord::Migration[5.0]
  def change
    add_column :poets, :reset_digest, :string
    add_column :poets, :reset_sent_at, :datetime
  end
end
