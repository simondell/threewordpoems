class RenameDisplayNameToNameForPoets < ActiveRecord::Migration
  def change
    rename_column :poets, :display_name, :name
  end
end
