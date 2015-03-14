require 'rails_helper'


feature 'User can Create, Read, Update and Delete Users with flash messages' do
  scenario 'Test User-Index page content, links redirects and funtionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Users'
    expect(current_path).to eq users_path

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Tasks'
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
    end

    expect(page).to have_content 'Users'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Email'

    within('table.table') do
      expect(find_link('Chase Gnar')[:href]).to eq(user_path(User.last))
      expect(find_link('chasegnar@gmail.com')[:href]).to eq('mailto:chasegnar@gmail.com')
      expect(page).to have_content 'Edit'
    end

    click_link "New User"
    expect(current_path).to eq (new_user_path)

  end

  scenario 'Test New-User page for content, links, flash message, redirects and functionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Users'
    click_link 'New User'
    expect(current_path).to eq new_user_path

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Tasks'
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
    end


    expect(page).to have_content 'New User'

    expect(page).to have_content 'First Name'
    expect(page).to have_content 'Last Name'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password Confirmation'

    expect(find_link('Cancel')[:href]).to eq(users_path)
    click_button 'Create User'

    within('div.alert.alert-danger') do
      expect(page).to have_content '4 errors prohibited this form from being saved'
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
    end

    fill_in 'First Name', with: 'Test'
    fill_in 'Last Name', with: 'Person'
    fill_in 'Email', with: 'testperson@gmail.com'
    fill_in 'Password', with: 'pp'
    fill_in 'Password Confirmation', with: 'pp'
    click_button 'Create User'

    expect(current_path).to eq (users_path)
    expect(page).to have_content 'User was successfully created'

  end

  scenario 'Test Show_page content, links, flash message, redirects and functionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Users'
    click_link 'New User'
    enter_new_test_person_information
    expect(current_path).to eq (users_path)

    expect(page).to have_link 'Edit'
    expect(page).to have_link 'testperson@gmail.com'
    click_link 'Test Person'
    expect(current_path).to eq (user_path(User.last))




  end




end
