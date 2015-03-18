namespace :cleanup do

  desc 'Removes all memberships where their users have already been deleted'
    task above_task: :environment do

      puts 'Removes all memberships where their users have already been deleted'
    end

  desc 'Removes all memberships where their projects have already been deleted'
    task above_task: :environment do

      puts 'Removes all memberships where their projects have already been deleted'
    end

  desc 'Removes all tasks where their projects have been deleted'
    task above_task: :environment do

      puts 'Removes all tasks where their projects have been deleted'
    end

  desc 'Removes all comments where their tasks have been deleted'
    task above_task: :environment do

      puts 'Removes all comments where their tasks have been deleted'
    end

  desc 'Sets the user_id of comments to nil if their users have been deleted'
    task above_task: :environment do

      puts 'Sets the user_id of comments to nil if their users have been deleted'
    end

  desc 'Removes any tasks with null project_id'
    task above_task: :environment do

      puts 'Removes any tasks with null project_id'
    end

  desc 'Removes any comments with a null task_id'
    task above_task: :environment do

      puts 'Removes any comments with a null task_id'
    end

  desc 'Removes any memberships with a null project_id or user_id'
    task above_task: :environment do

      puts 'Removes any memberships with a null project_id or user_id'
    end


end
