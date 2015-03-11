def create_user
  user = User.create(
  first_name: 'Chase',
  last_name: 'Terzian',
  email: 'chase@gmail.com',
  password: 'pp',
  password_confirmation: 'pp')
  user.save
end

def login
  fill_in "Email", with: 'chase@gmail.com'
  fill_in "Password", with: 'pp'
end

def navbar
  expect(page).to have_link("Sign In", visible: false)
  expect(page).to have_link("Sign Out", visible: false)
  expect(page).to have_link("gCamp", visible: false)
  expect(page).to have_link("Chase", visible: false)
end

# fill_in 'First Name', with: 'Chase'
# fill_in 'Last Name', with: "Terzian"
# fill_in 'Email', with: 'chaseterzian@gmail.com'
# fill_in 'Password', with: 'p1'
# fill_in 'Password Confirmation', with: 'p1'
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
