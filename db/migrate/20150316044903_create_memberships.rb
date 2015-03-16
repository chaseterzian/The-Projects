class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :role
      t.integer :project_id
      t.integer :user_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
