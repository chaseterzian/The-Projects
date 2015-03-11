require 'rails_helper'


feature 'User can sign in' do
  scenario 'test signing in' do

    @create_user

    visit root_path
    within('.navbar') {click_link('Sign In')}
    @expath = '/sign-in'

    @exsignin
    @exsignout
    @exgcamp
    @excontent = 'Email'
    @excontent = 'Password'
    @excontent = 'Sign In'

    fill_in "Email", with: 'chaseterzian@gmail.com'
    fill_in "Password", with: 'p1'
    @cb = 'Sign In'

    @expath = root_path

  end
end



    # expect(page).to have_link("Sign In", visible: false)

  # scenario 'test' do
  #       expect(page).to have_content 'Sign Out'
  # end




# feature 'User can CRUD tasks that include flash messages CUD' do
#   scenario 'User can create a new task from the task index' do
#     visit tasks_path
#     expect(page).to have_content 'Tasks'
#     expect(page).to have_content 'Description'
#     expect(page).to have_content 'Due On'
#     click_link 'New Task'

    # expect(current_path).to eq new_task_path
    # expect(page).to have_content 'New Task'
    # expect(page).to have_content 'Description'
    # visit tasks_path
    # fill_in :task_description, with: 'test'
    # fill_in :task_due_date, with: 1012015
    # expect(find_link('New Task')[:href]).to eq(new_task_path)
    # expect(find_link('Edit')[:href]).to eq(edit_task_path)
    # click_button 'Create task'
    #
    # visit tasks_path
    # expect(page).to have_content 'test'
    #
    #   save_and_open_page

    # expect(current_path).to eq '/'


    # taskn1 = Task.new(description: 'Cap-spec test description one')
    # taskn1.save!
    # taskn2 = Task.new(description: 'Cap-spec test 2', due_date: 1012015)
    # taskn2.save!
# end
# end
