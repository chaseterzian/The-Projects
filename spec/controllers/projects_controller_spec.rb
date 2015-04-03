require 'spec_helper'

describe ProjectsController do
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
    it 'should redirect a non member to projects path' do
      project = create_project
      user = create_user2
      session[:user_id] = user.id
      membership = create_membership(project, create_user, role: 'Member')

      get :show, id: project.id

      expect(response).to redirect_to projects_path
    end

      # it 'should render the show for a member' do
      #   membership = create_membership(project, member)
      #   session[:user_id] = member.id
      #
      #   get :show, id: project.id
      #
      #   expect(response).to render_template :show
      # end
  end

  describe 'PATCH #update' do
    it 'should redirect a vistor to sign in path' do

      patch :update, id: project.id
      expect(response).to redirect_to sign_in_path
    end

    it 'it redirects a member to projects path' do
      membership = create_membership(project, member)
    end
  end



  describe 'DELETE #destroy' do
    it 'should not allow a non member to destroy' do
      session[:user_id] = member.id

      delete :destroy, id: project.id

      expect(response).to redirect_to projects_path
      expect(flash[:warning]).to eq("You do not have access to that project")

    end
  end


end
