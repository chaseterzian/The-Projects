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
    @exsignout
    @exgcamp
    @exuser

  end
end
