class AddDuedateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :duedate, :date
  end
end
