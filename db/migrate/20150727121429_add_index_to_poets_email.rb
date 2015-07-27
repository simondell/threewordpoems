class AddIndexToPoetsEmail < ActiveRecord::Migration
  def change
  	add_index :poets, :email, unique: true
  end
end
