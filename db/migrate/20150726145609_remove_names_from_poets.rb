class RemoveNamesFromPoets < ActiveRecord::Migration
  def change
  	remove_column :poets, :first_name
  	remove_column :poets, :last_name
  end
end
