namespace :cleanup do

  desc 'Removes all memberships where their users have already been deleted' do
  end

  desc 'Removes all memberships where their projects have already been deleted' do
  end

  desc 'Removes all tasks where their projects have been deleted' do
  end

  desc 'Removes all comments where their tasks have been deleted' do
  end

  desc 'Sets the user_id of comments to nil if their users have been deleted' do
  end

  desc 'Removes any tasks with null project_id' do
  end

  desc 'Removes any comments with a null task_id' do
  end

  desc 'Removes any memberships with a null project_id or user_id' do
  end

  
end
