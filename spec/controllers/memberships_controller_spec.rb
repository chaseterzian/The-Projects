require 'rails_helper'

describe MembershipsController do
  let(:admin) { create_user2(admin: true) }
  let(:non_member) { create_user2 }
  let(:project) { create_project }
  let(:member) { create_user2 }
  let(:membership) { create_membership(member, project) }


  describe 'DELETE #destroy' do
      it "Does not allow a member to delete another member" do
        user1 =  create_user2(admin: false, email: 'thing1@email.com')
        user2 =  create_user2(admin: false, email: 'thing2@email.com')
        user3 =  create_user2(admin: false, email: 'thing3@email.com')
        create_membership(user1, project, role: "Member")
        create_membership(user2, project, role: "Owner")
        create_membership(user3, project, role: "Owner")

        session[:user_id] = user1.id

        delete :destroy, {project_id: project.id, :id => membership.to_param}

        expect(response).to redirect_to(projects_path)
      end
    end


end
