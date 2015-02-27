class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :tasks, :duedate, :due_date
  end
end
