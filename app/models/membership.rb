class Membership < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

# validates_inclusion_of :role, :in => ROLE
ROLE = ['Member', 'Owner']
validates :user_id, presence: true
validates :user_id, uniqueness: {scope: :project_id, :message => "has already been added to this project"}
# validates :role, presence: ("Owner")

  # def member_role
  #   "#{ROLE}"
  # end


end
