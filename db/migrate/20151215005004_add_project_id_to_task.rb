class AddProjectIdToTask < ActiveRecord::Migration
  def up
    add_column :tasks, :project_id, :integer
  end
  
  def down
    remove_column :tasks, :project_id, :integer
  end
end