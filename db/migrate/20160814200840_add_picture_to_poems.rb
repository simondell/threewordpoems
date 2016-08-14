class AddPictureToPoems < ActiveRecord::Migration[5.0]
  def change
    add_column :poems, :picture, :string
  end
end
