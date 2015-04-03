require 'rails_helper'

describe UsersController do
  let(:admin) { create_user2(admin: true) }
  let(:non_member) { create_user2 }
  let(:project) { create_project }
  let(:member) {create_user2}

  describe 'GET #index' do
    describe 'Permissions' do
      it 'should redirect a visitor to sign in path' do
        get :index
        expect(response).to redirect_to sign_in_path
      end
      it 'should render projects page for a logged in user ' do
        user = create_user
        session[:user_id] = user.id

        get :index

        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    it 'should redirect a visotor to sign in path' do
      project = create_project
      get :show, id: project.id
      expect(response).to redirect_to sign_in_path
    end
  end

  # it 'should redirect a non member to user show' do
  #   project = create_project
  #   user = create_user2
  #   session[:user_id] = user.id
  #   membership = create_membership(project, create_user, role: 'Member')
  #
  #   get :show, id: user.id
  #
  #   expect(response).to redirect_to user_path(user_id)
  # end



end
