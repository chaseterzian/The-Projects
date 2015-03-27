# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Project.delete_all
Task.delete_all
Comment.delete_all
Membership.delete_all


membership = Membership.create(
  role: 'member',
  project_id: 999100,
  user_id: 999101)
   # id: 999201)
   # membership.update_attribute(:role, 'owner')
   # membership.update_attribute(:project_id, 999102)
   # membership.update_attribute(:user_id, 999103)


user = User.create(
  first_name: 'Chase',
  last_name: 'Money',
  email: 'fuckgcamp@money.com',
  password: 'pp')
   # id: 999200)
   # user.update_attribute(:first_name, 'Chasen')
   # user.update_attribute(:last_name, 'Domino')
   # user.update_attribute(:id, 999105)


project = Project.create(
  name: 'Testing Project')
   # id: 999106)
   # project.update_attribute(:name, 'Testing Project')
   # project.update_attribute(:id, 999107)


comment = Comment.create(
  body: 'shamalama ding dong',
  user_id: 999108,
  task_id: 999109)
    # comment.update_attribute(:body, 'stink pants mcfly')
    # comment.update_attribute(:user_id, 999110)
    # comment.update_attribute(:task_id, 999111)


task = Task.create(
  description: 'Some description',
  project_id: 999112)
    # task.update_attribute(:description, 'Bob mcjoneserton')
    # task.update_attribute(:project_id, 999114)



owner = User.create!(
first_name: 'Owner',
last_name: 'User',
email: 'owner@example.com',
password: 'password'
)

member = User.create!(
first_name: 'Member',
last_name: 'User',
email: 'member@example.com',
password: 'password'
)

user = User.create!(
first_name: 'Basic',
last_name: 'User',
email: 'user@example.com',
password: 'password'
)

multiple_owners = Project.create!(name: 'Multiple Owners')
Membership.create!(
project: multiple_owners,
user: owner,
role: 'owner'
)
Membership.create!(
project: multiple_owners,
user: user,
role: 'owner'
)
Membership.create!(
project: multiple_owners,
user: member,
role: 'member'
)

task1 = Task.create!(
description: "Write 3 comments",
project: multiple_owners,
due_date: 4.days.from_now
)

task2 = Task.create!(
description: "Write 1 comment",
project: multiple_owners,
due_date: 5.days.from_now
)

3.times do
 Comment.create!(
 task: task1,
 user: owner,
 body: Faker::Lorem.sentence
 )
end

Comment.create!(
task: task2,
user: member,
body: Faker::Lorem.sentence
)

single_owner = Project.create!(name: 'Single Owner')
Membership.create!(
project: single_owner,
user: owner,
role: 'owner'
)
Membership.create!(
project: single_owner,
user: member,
role: 'member'
)

   p user
   p membership
   p project
   p comment
   p task
   #update attribute method
