require 'spec_helper'

describe TasksController do
  User.destroy_all

  before {@user = create_user2}


  describe 'GET #index' do
  describe 'redirects if not project member' do


    it 'redirects to projects path' do
      project = create_project1
      session[:user_id] = @user.id
      get :index, project_id: project.id
      expect(response).to redirect_to(projects_path)
    end

    it 'redirects on new to projects path' do
      project = create_project1
      session[:user_id] = @user.id
      get :new, project_id: project.id
      expect(response).to redirect_to(projects_path)
    end
  end
end
end
