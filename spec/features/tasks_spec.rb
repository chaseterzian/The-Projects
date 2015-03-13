require 'rails_helper'


feature 'Once signed in, user can see, edit, make, and destroy tasks' do
  scenario 'Test Task-Index page content and links'  do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Tasks'
    expect(current_path).to eq tasks_path


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

    expect(page).to have_content 'Tasks'          #header
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Due On'

    expect(find_link('New Task')[:href]).to eq(new_task_path)
    click_link 'New Task'
    expect(current_path).to eq new_task_path

  end

  scenario 'Test New-Task page for content links and validations'  do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Tasks'
    click_link 'New Task'
    expect(current_path).to eq new_task_path

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

    within("ol.breadcrumb") do
      expect(page).to have_link 'Tasks'
      expect(page).to have_content 'New Task'
    end

    expect(page).to have_content 'New Task'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Due Date'

    expect(page).to have_button 'Create task'
    expect(page).to have_link 'Cancel'
    expect(find_link('Cancel')[:href]).to eq(tasks_path)

    click_button 'Create task'
    expect(page).to have_content '1 error prohibited this form from being saved'
    expect(page).to have_content "Description can't be blank"

    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'

    click_button 'Create task'
    expect(current_path).to eq task_path(Task.last)
    expect(page).to have_content 'Task was successfully created'

    within("ol.breadcrumb") do
      expect(page).to have_link 'Tasks'
      expect(page).to have_content 'Test Description'
    end

    expect(page).to have_content 'Due Date:'
    expect(page).to have_content '1/01/2015'


  end

  scenario 'Test Show-Task page for content, links, and validations' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Tasks'
    click_link 'New Task'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'
    click_button 'Create task'
    expect(current_path).to eq task_path(Task.last)

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'
    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'

    within('footer') do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Tasks'
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
    end

    within('ol.breadcrumb') do
      expect(page).to have_content 'Tasks'
      expect(page).to have_content 'Test Description'
    end

    expect(page).to have_content 'Due Date:'
    expect(page).to have_content '1/01/2015'

    expect(page).to have_link 'Edit'
    click_link 'Edit'
    expect(current_path).to eq edit_task_path(Task.last)

  end

  scenario 'Test Edit-Task page for content and links' do

    create_user
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Tasks'
    click_link 'New Task'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'
    click_button 'Create task'
    click_link 'Edit'
    expect(current_path).to eq edit_task_path(Task.last)

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'
    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'

    within('footer') do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Tasks'
      expect(page).to have_link 'Users'
      expect(page).to have_link 'Projects'
    end

    within('ol.breadcrumb') do
      expect(page).to have_content 'Tasks'
      expect(page).to have_content 'New Task'  #should this be Test Descr?
    end

    expect(page).to have_content 'Edit Task'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Due Date'
    expect(page).to have_content 'Complete'

    # within('label') do                          #multiple instances
    #   expect(page).to have_content 'Test Description'
    #   expect(page).to have_content '01/01/2015'
    # checkbox
    # end

    fill_in 'Description', with: 'Test Description Edited'
    fill_in 'Due Date', with: '02/02/2014'

    expect(page).to have_button 'Update task'
    expect(find_link('Cancel')[:href]).to eq(tasks_path)

    click_button 'Update task'
    expect(current_path).to eq task_path(Task.last)

    epthc 








  end

end
