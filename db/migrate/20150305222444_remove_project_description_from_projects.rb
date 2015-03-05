class RemoveProjectDescriptionFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :project_description, :string
  end
end
