def create_user
  user = User.create!(first_name: 'Chase',
   last_name: 'Gnar',
   email: 'chasegnar@gmail.com',
   password: 'pp',
   password_confirmation: 'pp',
   admin: true)
end

def login
  fill_in 'Email', with: 'chasegnar@gmail.com'
  fill_in 'Password', with: 'pp'
end

def signup
  fill_in 'First Name', with: 'Michael'
  fill_in 'Last Name', with: 'Sprinklewood'
  fill_in 'Email', with: 'Michael@gmail.com'
  fill_in 'Password', with: 'ppp'
  fill_in 'Password Confirmation', with: 'ppp'
end

def saveopen
  save_and_open_page
end

def enter_new_test_person_information
  fill_in 'First Name', with: 'Test'
  fill_in 'Last Name', with: 'Person'
  fill_in 'Email', with: 'testperson@gmail.com'
  fill_in 'Password', with: 'pp'
  fill_in 'Password Confirmation', with: 'pp'
  click_button 'Create User'
end

def create_project
  project = Project.create!(
  name: 'Existing Project')
end

# user2 = create_user
# u]






# project = create_project
# create_membership(project, user, role: 'Owner')
# create_membership(project, user2)

def create_task
  task = Task.create!(
  description: 'Test Task'
  )
end

# def create_user2(options = {})
#   User.create!({
#     first_name: 'Billy',
#     last_name: 'Bobby',
#     email: "billy#{rand(10000)+1}@bobby.com",
#     password: 'password',
#     admin: false
#   }.merge(options))
# end


def create_user2
  user = User.create!(
    first_name: 'Billy',
    last_name: 'Bobby',
    email: "billy#{rand(10000)+1}@bobby.com",
    password: 'password',
    admin: false)
end


# def create_membership(options = {})
#   Membership.create!(
#     user_id: user.id,
#     project_id: project.id,
#     role: 'Member'
#   }.merge(options))
# end

def create_membership(user, project)
  member = Membership.create!(
    user_id: user.id,
    project_id: project.id,
    role: 'Member')
end

def create_project1

  Project.create!(name: 'Existing Project')
end

def create_task1
  Task.create!(description: 'Test Task',
    project_id: project.id,
    complete: false,
    due_date: '2015-03-04')
end
