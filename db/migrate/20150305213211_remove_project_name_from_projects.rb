class RemoveProjectNameFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :project_name, :string
  end
end
