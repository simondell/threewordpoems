class AddMaximisedToPoem < ActiveRecord::Migration
  def change
    add_column :poems, :maximised, :boolean, default: true
  end
end
