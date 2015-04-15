class AddWorkflowStepToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :workflow_step, :integer, default: 0
  end
end
