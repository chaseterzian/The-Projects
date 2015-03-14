require 'rails_helper'

feature 'User can Create, Read, Update and Delete Projects with flash messages.' do

  scenario 'Test Projects-Index page links, redirects, content and funtionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    expect(current_path).to eq projects_path

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


    expect(page).to have_content 'Projects'
    expect(page).to have_content 'Name'
    click_link 'New Project'

  end

  scenario 'Test New-Project page for content, links, flash message, redirects and functionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'New Project'
    expect(current_path).to eq (new_project_path)

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


    expect(page).to have_content 'New Project'
    expect(page).to have_content 'Name'
    expect(find_link('Cancel')[:href]).to eq(projects_path)
    click_button 'Create Project'

    expect(page).to have_content '1 error prohibited this form from being saved'
    expect(page).to have_content "can't be blank"

    fill_in 'Name', with: 'Test Project'
    click_button 'Create Project'

    expect(current_path).to eq (project_path(Project.last))

  end

  scenario 'Test Show-Project page content, links, flash message, redirects and functionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'New Project'
    fill_in 'Name', with: 'Test Project'
    click_button 'Create Project'
    expect(current_path).to eq (project_path(Project.last))

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


    # expect(page).to have_content 'Project was successfully created'
    # expect(page).to have_content 'Test Project'
    # expect(find_link('Delete')[:href]).to eq(projects_pats)
    # click_button 'Edit'
    # expect(current_path).to eq (edit_project_path(Project.last))

  end


  end
