class CreatePoems < ActiveRecord::Migration[5.0]
  def change
    create_table :poems do |t|
      t.string :title
      t.text :content
      t.references :poet, foreign_key: true

      t.timestamps
    end
    add_index :poems, [:poet_id, :created_at]
  end
end
