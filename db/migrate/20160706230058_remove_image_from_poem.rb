class RemoveImageFromPoem < ActiveRecord::Migration
  def change
    remove_column :poems, :image, :string, {}
  end
end
