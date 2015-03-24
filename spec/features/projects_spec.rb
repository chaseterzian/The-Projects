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
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
      expect(page).to_not have_link 'Tasks'
    end


    expect(page).to have_content 'Projects'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Tasks'
    click_link 'New Project'
    expect(current_path).to eq (new_project_path)

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
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
      expect(page).to_not have_link 'Tasks'
    end

    within(".breadcrumb") do
      expect(page).to have_link 'Projects'
      expect(page).to have_content 'New Project'
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
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
      expect(page).to_not have_link 'Tasks'
    end

    within(".breadcrumb") do
      expect(page).to have_link 'Projects'
      expect(page).to have_content 'Test Project'
    end

    expect(page).to have_link '0 Tasks'
    expect(page).to have_link '0 Memberships'

    expect(page).to have_content 'Project was successfully created'
    expect(page).to have_content 'Test Project'
    expect(page).to have_link 'Delete'
    click_link 'Edit'

    expect(current_path).to eq (edit_project_path(Project.last))

  end

  scenario 'Test Edit-Page content, links, flash message, redirects and functionality' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'New Project'
    fill_in 'Name', with: 'Test Project'
    click_button 'Create Project'
    click_link 'Edit'
    expect(current_path).to eq (edit_project_path(Project.last))

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    within("footer") do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
      expect(page).to_not have_link 'Tasks'
    end

    within(".breadcrumb") do
      expect(page).to have_link 'Projects'
      expect(page).to have_link 'Test Project'
      expect(page).to have_content 'Edit'
    end

    expect(page).to have_content 'Edit Project'
    expect(page).to have_content 'Name'
    expect(find_link('Cancel')[:href]).to eq(projects_path)

    fill_in 'Name', with: ' '
    click_button 'Update Project'
    expect(page).to have_content '1 error prohibited this form from being saved'
    expect(page).to have_content "can't be blank"

    fill_in 'Name', with: 'Test Project Edited'
    click_button 'Update Project'
    expect(current_path).to eq (project_path(Project.last))
    expect(page).to have_content 'Project was successfully updated'
    expect(page).to have_content 'Test Project Edited'

  end

  scenario 'Test delete project and existing project functons and flash messages' do

    create_user
    create_project
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'New Project'
    fill_in 'Name', with: 'Test Project'
    click_button 'Create Project'
    expect(current_path).to eq (project_path(Project.last))

    within(".well") do
    click_link 'Delete'
  end

    expect(current_path).to eq (projects_path)

    expect(page).to have_content 'Project was successfully deleted'
    expect(find_link('Existing Project')[:href]).to eq(project_path(Project.first))

  end

end
