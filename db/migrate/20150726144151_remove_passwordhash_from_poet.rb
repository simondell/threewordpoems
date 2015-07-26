class RemovePasswordhashFromPoet < ActiveRecord::Migration
  def change
  	remove_column :poets, :passwordhash
  end
end
