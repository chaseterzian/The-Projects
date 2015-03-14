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

def create_task
  project = Project.create!(
  name: 'Test Project')
end




# def test
# fill_in 'First Name', with: 'Chase'
# fill_in 'Last Name', with: 'Gnar'
# fill_in 'Email', with: 'chasegnar@gmail.com'
# fill_in 'Password', with: 'pp'
# fill_in 'Password Confirmation', with: 'pp'
# end

# def signout_user
#   user2 = User.create!(
#   first_name: 'Tronaloneous',
#   last_name: 'Monk',
#   email: 'tronmonk@gmail.com',
#   password: 'p',
#   password_confirmation: 'p')
# end
#
# def login_signout_user
#   fill_in 'Email', with: 'tronmonk@gmail.com'
#   fill_in 'Password', with: 'p'
# end










# def create_user2
#   user = User.create(
#   first_name: 'Chase',
#   last_name: 'Terzian',
#   email: 'chase@gm.com',
#   password: 'pp',
#   password_confirmation: 'pp')
# end











# def navbar
#   expect(page).to have_link("Sign In", visible: false)
#   expect(page).to have_link("Sign Out", visible: false)
#   expect(page).to have_link("gCamp", visible: false)
#   expect(page).to have_link("Chase", visible: false)
# end

# fill_in 'First Name', with: 'Chase'
# fill_in 'Last Name', with: "Terzian"
# fill_in 'Email', with: 'chase@gmail.com'
# fill_in 'Password', with: 'pp'
# fill_in 'Password Confirmation', with: 'pp'
# click_link 'Sign Up'



# def loginn
#   user = User.new(first_name: 'Chase',
#                   last_name: 'Terzian',
#                   email: 'chaseterzian@gmail.com',
#                   password: 'p1',
#                   password_confirmation: 'p1')
#   user.save
#
#   visit signin_path
#   fill_in 'Email', with: 'chaseterzian@gmail.com'
#   fill_in 'Password', with: 'p1'
#   click_link 'Sign In'
# end
