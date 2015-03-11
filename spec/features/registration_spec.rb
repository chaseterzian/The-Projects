require 'rails_helper'

feature 'User can create an account' do
  scenario 'User can not see tasks, users, or projects until account created - flash present ' do

    create_user

    visit root_path
    expect(page).to have_link 'Sign Up'
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'gCamp'
    expect(page).to_not have_link 'Sign Out'

    within('.navbar') {click_link('Sign In')}
    expect(current_path).to eq '/sign-in'




  end
end
