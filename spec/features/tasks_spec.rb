require 'spec_helper'


feature 'Once signed in, user can see, edit, make, and destroy tasks with proper redirects and errors' do
  scenario 'Test Task-Index page content links, redirects and functionality'  do

    create_user
    project = create_project
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'Existing Project'
    click_link '0 Tasks'

    expect(current_path).to eq (project_tasks_path(project))

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
      expect(page).to have_link 'Home'
    end

    expect(page).to have_content 'Tasks for Existing Project'          #header
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Due On'

    within(".breadcrumb") do
      expect(page).to have_link 'Projects'
      expect(page).to have_link 'Existing Project'
      expect(page).to have_content 'Tasks'
    end

    click_link 'New Task'
    expect(current_path).to eq (new_project_task_path(project))
  end

  scenario 'Test New-Task page for content, links, flash message, redirects and functionality'  do #user able to...

    create_user
    project = create_project
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'Existing Project'
    click_link '0 Tasks'
    click_link 'New Task'
    expect(current_path).to eq (new_project_task_path(project))

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
      expect(page).to have_link 'Home'
    end

    within("ol.breadcrumb") do
      expect(page).to have_link 'Project'
      expect(page).to have_link 'Existing Project'
      expect(page).to have_link 'Tasks'
      expect(page).to have_content 'New Task'
    end

    expect(page).to have_content 'New Task'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Due Date'

    expect(page).to have_button 'Create task'
    expect(find_link('Cancel')[:href]).to eq(project_tasks_path(project))
    click_button 'Create task'
    expect(page).to have_content '1 error prohibited this form from being saved'
    expect(page).to have_content "Description can't be blank"

    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'

    click_button 'Create task'

    expect(current_path).to eq (project_task_path(project, Task.last))
    expect(page).to have_content 'Task was successfully created'
    expect(page).to have_content 'Test Description'

  end

  scenario 'Test Show-Task page for content, links, validationc content, redirects and functionality' do

    create_user
    project = create_project
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'Existing Project'
    click_link '0 Tasks'
    click_link 'New Task'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'
    click_button 'Create task'
    expect(current_path).to eq (project_task_path(project, Task.last))

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    within('footer') do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Home'
    end

    within('ol.breadcrumb') do
      expect(page).to have_link 'Project'
      expect(page).to have_link 'Existing Project'
      expect(page).to have_link 'Tasks'
      expect(page).to have_content 'Test Description'
    end

    expect(page).to have_content 'Due Date:'
    expect(page).to have_content '1/01/2015'

    click_link 'Edit'
    expect(current_path).to eq edit_project_task_path(project, Task.last)

  end

  scenario 'Test Edit-Task page for content, links, flash messgae, redirects and functionality' do

    create_user
    project = create_project
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'Existing Project'
    click_link '0 Tasks'
    click_link 'New Task'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'
    click_button 'Create task'
    click_link 'Edit'
    expect(current_path).to eq edit_project_task_path(project, Task.last)

    expect(page).to have_link 'gCamp'
    expect(page).to have_link 'Chase Gnar'
    expect(page).to have_link 'Sign Out'
    expect(page).to_not have_link 'Sign In'
    expect(page).to_not have_link 'Sign Up'

    within('footer') do
      expect(page).to have_link 'About'
      expect(page).to have_link 'Terms'
      expect(page).to have_link 'FAQ'
      expect(page).to have_link 'Home'
    end

    within('ol.breadcrumb') do
      expect(page).to have_link 'Project'
      expect(page).to have_link 'Existing Project'
      expect(page).to have_link 'Tasks'
      expect(page).to have_link 'Test Description'
      expect(page).to have_content 'Edit'
    end

    expect(page).to have_content 'Edit Task'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Due Date'
    expect(page).to have_content 'Complete'
    check 'Complete'

    fill_in 'Description', with: ''
    fill_in 'Due Date', with: ''
    click_button 'Update task'

    expect(page).to have_content '1 error prohibited this form from being saved'
    expect(page).to have_content "Description can't be blank"

    fill_in 'Description', with: 'Test Description Edited'
    fill_in 'Due Date', with: '02/02/2014'

    expect(find_link('Cancel')[:href]).to eq(project_tasks_path(project))
    click_button 'Update task'

    expect(current_path).to eq project_task_path(project, Task.last)
    expect(page).to have_content 'Task was successfully updated'

  end

  scenario 'After updating task, user is redirected to Show-Page with flash message' do

    create_user
    project = create_project
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'Existing Project'
    click_link '0 Tasks'
    click_link 'New Task'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'
    click_button 'Create task'
    click_link 'Edit'
    fill_in 'Description', with: 'Test Description Edited'
    fill_in 'Due Date', with: '02/02/2014'
    click_button 'Update task'
    expect(current_path).to eq project_task_path(project, Task.last)

    expect(page).to have_content 'Test Description Edited'
    expect(page).to have_content 'Due Date:'
    expect(page).to have_content '2/02/2014'
    expect(page).to have_content 'Comments'
    expect(page).to have_link 'Edit'
    expect(page).to have_button 'Add Comment'

    within('ol.breadcrumb') do
      expect(page).to have_link 'Project'
      expect(page).to have_link 'Existing Project'
      expect(page).to have_link 'Tasks'
      expect(page).to have_content 'Test Description Edited'
    end


  end

  scenario 'User can go back to Task-Index and can now see created and updated task' do

    create_user
    project = create_project
    visit signin_path
    login
    click_button 'Sign In'
    click_link 'Projects'
    click_link 'Existing Project'
    click_link '0 Tasks'
    click_link 'New Task'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Due Date', with: '01/01/2015'
    click_button 'Create task'
    click_link 'Edit'
    fill_in 'Description', with: 'Test Description Edited'
    fill_in 'Due Date', with: '02/02/2014'
    click_button 'Update task'
    within('ol.breadcrumb') do
      click_link 'Tasks'
    end


    expect(page).to have_link 'Test Description Edited'
    expect(page).to have_content '2/02/2014'
    expect(page).to have_link 'Edit'
    page.find('.glyphicon-remove').click


  end
end
