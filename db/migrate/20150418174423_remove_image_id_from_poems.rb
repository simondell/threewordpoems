class RemoveImageIdFromPoem < ActiveRecord::Migration
  def change
  	remove_column :poems, :image_id, :integer, {}
  end
end