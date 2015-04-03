require 'rails_helper'


feature 'User can Create, Read, Update and Delete Users with flash messages' do
  scenario 'Test User-Index page content, links redirects, and funtionality' do

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
      expect(page).to have_link 'Home'
    end

    expect(page).to have_content 'Users'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Email'

    within('table.table') do
      expect(find_link('Chase Gnar')[:href]).to eq(user_path(User.last))
      expect(find_link('chasegnar@gmail.com')[:href]).to eq('mailto:chasegnar@gmail.com')
      expect(find_link('Edit')[:href]).to eq(edit_user_path(User.last))
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
      expect(page).to have_link 'Home'
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

  scenario 'Test Show-Page content, links, flash message, redirects and functionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Users'
    click_link 'New User'
    enter_new_test_person_information
    expect(current_path).to eq (users_path)

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Home'
    end


    expect(page).to have_link 'Edit'
    expect(page).to have_link 'testperson@gmail.com'
    click_link 'Test Person'
    expect(current_path).to eq (user_path(User.last))

    expect(page).to have_content 'Test Person'
    expect(page).to have_content 'First Name'
    expect(page).to have_content 'Test'
    expect(page).to have_content 'Last Name'
    expect(page).to have_content 'Person'
    expect(page).to have_content 'Email'
    expect(find_link('testperson@gmail.com')[:href]).to eq('mailto:testperson@gmail.com')

    click_link 'Edit'
    expect(current_path).to eq (edit_user_path(User.last))

  end

  scenario 'Test Edit-Page content, links, flash message, redirects and functionality - redirect from user name on Index-Page' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Users'
    click_link 'New User'
    enter_new_test_person_information
    expect(current_path).to eq (users_path)
    click_link 'Test Person'
    click_link 'Edit'
    expect(current_path).to eq (edit_user_path(User.last))

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Home'
    end


    expect(page).to have_content 'Edit User'
    expect(page).to have_content 'First Name'
    expect(page).to have_content 'Last Name'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password Confirmation'

    expect(find_link('Cancel')[:href]).to eq(users_path)
    click_link 'Delete'

    expect(current_path).to eq (users_path)
    expect(page).to have_content 'User was successfully deleted'
    expect(page).to_not have_content 'Test Person'
    expect(page).to_not have_content 'testperson@gmail.com'

    click_link 'Edit'
    expect(current_path).to eq (edit_user_path(User.first))

    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: ''
    fill_in 'Email', with: ''

    click_button 'Update User'

    within('div.alert.alert-danger') do
      expect(page).to have_content '3 errors prohibited this form from being saved'
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
      expect(page).to have_content "Email can't be blank"
    end

    fill_in 'First Name', with: 'Chase'
    fill_in 'Last Name', with: 'Terzian'
    fill_in 'Password', with: 'pp'
    fill_in 'Email', with: 'chaset@gmail.com'
    fill_in 'Password Confirmation', with: 'pp'

    click_button 'Update User'
    expect(current_path).to eq (users_path)

    expect(page).to have_content 'User was successfully updated'
    expect(page).to have_content 'Chase Terzian'
    expect(page).to have_content 'chaset@gmail.com'

  end

  scenario 'User name in navbar links to the User-Show page' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Users'
    expect(current_path).to eq (users_path)

    within ('.navbar') do
      click_link 'Chase Gnar'
    end

    expect(current_path).to eq (user_path(User.first))

  end

end
