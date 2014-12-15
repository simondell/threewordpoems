class CreatePoemCategories < ActiveRecord::Migration
  def change
    create_table :poem_categories do |t|
      t.references :poem, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
