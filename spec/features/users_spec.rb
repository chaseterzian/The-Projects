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

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'

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
      # expect(find_link('Edit')[:href]).to eq(edit_user_path(User.last))                 #Ambiguous X4 Edit links
    end

    click_link "New User"
    expect(current_path).to eq (new_user_path)

  end

  scenario '' do



  end


end
