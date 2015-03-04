class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_description
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
