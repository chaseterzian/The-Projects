require 'rails_helper'


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

  it 'Confirms the presence of validations - user must enter a first name, last name, and email' do

    user = User.new(
    first_name: '',
    last_name: '',
    email: '',
    password: '',
    password_confirmation: '')
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
    expect(user.errors[:last_name]).to include("can't be blank")
    expect(user.errors[:email]).to include("can't be blank")
  end

end
