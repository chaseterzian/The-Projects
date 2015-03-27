namespace :cleanup do

  desc 'Removes all memberships where their users have already been deleted'
  task above_task: :environment do
    var = 0
    Membership.where.not(user_id: User.all).each do |membership|
      membership.destroy
      var = (var + 1)
      puts ""
      puts "     ....removing " + var.to_s + " file/s"
    end
    puts "There were/was " + var.to_s + " membership/s without users"
  end


  desc 'Removes all memberships where their projects have already been deleted'
  task above_task: :environment do
    var = 0
    Membership.where.not(project_id: Project.all).each do |membership|
      membership.destroy
      var = (var + 1)
      puts ""
      puts "     ....removing " + var.to_s + " file/s"
    end
    puts "There were/was " + var.to_s + " membership/s where their projects have already been deleted"
  end


  desc 'Removes all tasks where their projects have been deleted'
  task above_task: :environment do
    var = 0
    Task.where.not(project_id: Project.all).each do |task|
      task.destroy
      var = (var + 1)
      puts ""
      puts "     ....removing " + var.to_s + " file/s"
    end
    puts "There were/was " + var.to_s + " task/s where their projects had been deleted"
  end


  desc 'Removes all comments where their tasks have been deleted'
  task above_task: :environment do
    var = 0
    Comment.where.not(task_id: Task.all).each do |comment|
      comment.destroy
      var = (var + 1)
      puts ""
      puts "     ....removing " + var.to_s + " file/s"
    end
    puts "There were/was " + var.to_s + " comment/s where their tasks have been deleted"
  end


  desc 'Sets the user_id of comments to nil if their users have been deleted'
  task above_task: :environment do
    var = 0
    Comment.where.not(user_id: User.all).each do |comment|
      comment.user_id = nil
      var = (var + 1)
      puts ""
      puts "     ....setting " + var.to_s + " file/s to 'nil'"
    end
    puts "Set " + var.to_s + " user_id/s of comments to nil where their users have been deleted"
  end


  desc 'Removes any tasks with null project_id'
  task above_task: :environment do
    var = 0
    Task.all.each do |task|
      if task == :null
        task.destroy
        var = (var + 1)
        puts ""
        puts "     ....removing " + var.to_s + " task/s"
      end
    end
    puts "Removed " + var.to_s + " task/s with null project_id"
  end


  desc 'Removes any comments with a null task_id'
  task above_task: :environment do
    var = 0
    Comment.all.each do |comment|
      if comment == :null
        comment.destroy
        var = (var + 1)
        puts ""
        puts "     ....removing " + var.to_s + " comment/s"
      end
    end
    puts 'Removed any comments with a null task_id'
  end


  desc 'Removes any memberships with a null project_id or user_id'
  task above_task: :environment do
    var = 0
    Membership.where(user_id: nil).each do |membership|
      membership.destroy
      var = (var + 1)
      puts ""
      puts "     ....removing " + var.to_s + " file/s"
    end
    puts "There were/was " + var.to_s + " membership/s with a null project/user_id"
  end

end
