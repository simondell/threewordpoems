class RemoveTopTenFromPoem < ActiveRecord::Migration
  def change
  	remove_column :poems, :top_ten
  end
end
