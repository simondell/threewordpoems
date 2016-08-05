class AddEditorToPoets < ActiveRecord::Migration[5.0]
  def change
    add_column :poets, :editor, :boolean, default: false
  end
end
