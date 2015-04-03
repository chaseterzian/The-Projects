require 'rails_helper'

describe UsersController do
  let(:admin) { create_user2(admin: true) }
  let(:user) { create_user2(email: "whatever@example.com") }
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
    it 'should redirect a visitor to sign in path' do
      get :show, id: user.id
      expect(response).to redirect_to sign_in_path
    end
  end
  

  describe 'DELETE #destroy' do
    it 'should not allow a non-admin to delete another user' do
      session[:user_id] = member.id

      delete :destroy, id: user.id

      expect(response).to redirect_to users_path
    end
  end




end
