class AddKeywordsToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :keywords, :text
  end
end
