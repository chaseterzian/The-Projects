require 'rails_helper'


feature 'User can sign out, is redirected to root-path, and no longer has access to tasks, users, or projects - flash present' do
  scenario 'User can sign out after signing in'  do


    create_user
    visit signin_path
    login
    click_button 'Sign In'
    expect(current_path).to eq projects_path


    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Home'
    end

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    click_link 'Sign Out'
    expect(current_path).to eq root_path

    expect(page).to have_content 'You have successfully logged out'
    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Sign Up'
    expect(page).to_not have_link 'Sign Out'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to_not have_link 'Tasks'
      expect(page).to_not have_link 'Users'
      expect(page).to_not have_link 'Projects'
    end

  end
end
