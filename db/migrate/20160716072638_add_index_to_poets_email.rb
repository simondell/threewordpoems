class AddIndexToPoetsEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :poets, :email, unique: true
  end
end
