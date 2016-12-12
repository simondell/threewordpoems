class AddModeratedToPoems < ActiveRecord::Migration[5.0]
  def change
    add_column :poems, :moderated, :boolean, default: false
  end
end
