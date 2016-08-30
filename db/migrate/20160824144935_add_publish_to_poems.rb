class AddPublishToPoems < ActiveRecord::Migration[5.0]
  def change
    add_column :poems, :publish, :boolean, default: false
  end
end
