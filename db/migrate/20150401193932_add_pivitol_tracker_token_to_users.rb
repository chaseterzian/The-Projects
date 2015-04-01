class AddPivitolTrackerTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pivitol_tracker_token, :string
  end
end
