def create_user
  user = User.create(
  first_name: 'Chase',
  last_name: 'Terzian',
  email: 'chaseterzian@gmail.com',
  password: 'p1',
  password_confirmation: 'p1')
  user.save
end

def excontent
  expect(page).to have_content
end

def exlink
  expect(page).to have_link
end

def exsignin
  expect(page).to have_link("Sign In", visible: false)
end

def exsignout
  expect(page).to have_link("Sign Out", visible: false)
end

def exgcamp
  expect(page).to have_link("gCamp", visible: false)
end

def exuser
  expect(page).to have_link("Chase Terzian", visible: false)
end

def expath
  expect(current_path).to eq
end

def cb
  click_button
end

def cl
  click_link
end

def login
  fill_in "Email", with: 'chaseterzian@gmail.com'
  fill_in "Password", with: 'p1'
end

def nav_click
  within('.navbar') {click_link(
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
