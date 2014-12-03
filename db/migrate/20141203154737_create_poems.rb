class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title
      t.string :body
      t.integer :poet_id

      t.timestamps
    end
  end
end
