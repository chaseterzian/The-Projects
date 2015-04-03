require 'rails_helper'


feature 'Existing user sign-in' do
  scenario 'User can not see users, tasks, or projects until signed in - flash present' do


    create_user
    visit root_path
    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Sign Up'
    expect(page).to_not have_link 'Sign Out'

    within('.navbar') {click_link('Sign In')}
    expect(current_path).to eq '/sign-in'

    expect(page).to have_content 'Sign into gCamp'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_link 'Sign In'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
    end

    click_button 'Sign In'
    expect(page).to have_content 'Email / Password combination is invalid'

    login
    click_button 'Sign In'

    expect(current_path).to eq projects_path
    expect(page).to have_content 'You have successfully signed in'

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    within('.navbar') do
      expect(page).to have_link 'Projects'
      expect(page).to have_link 'Users'
    end


    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Home'
    end

  end
end
