def create_user
  user = User.create!(
  first_name: 'Chase',
  last_name: 'Gnar',
  email: 'chasegnar@gmail.com',
  password: 'pp',
  password_confirmation: 'pp')
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

def create_task
  task = Task.create!(
  description: 'Test Task'
  )
end
