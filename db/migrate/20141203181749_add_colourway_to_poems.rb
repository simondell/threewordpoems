class AddColourwayToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :colourway_id, :integer
  end
end
