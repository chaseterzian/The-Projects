describe Task do

  it 'Confirms the presence of a first name, last name, and email'  do

    user = User.new(
      first_name: 'Chase',
      last_name: 'Gnar',
      email: 'chasegnar@gmail.com',
      password: 'pp',
      password_confirmation: 'pp')
    expect(user).to be_valid
  end
end





# describe Task do
#
#   it 'Confirms the presence of a description for a new task' do
#
#     task = Task.new(description: 'Description Validation')
#     expect(task).to be_valid
#   end
#
#   it 'Confirms the presence of a validation message when no description is entered' do
#
#     task = Task.new(description: '')
#     task.valid?
#     expect(task.errors[:description]).to include("can't be blank")
#   end

  #how to test the edit page, where to specify path?
