class AddTopTenToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :top_ten, :boolean
  end
end
