class AddImageIdToPoem < ActiveRecord::Migration
  def change
    add_column :poems, :image_id, :integer
  end
end
