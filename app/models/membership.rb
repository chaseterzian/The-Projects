class Membership < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  ROLE = ['Member', 'Owner']
validates_inclusion_of :role, :in => ROLE
validates :user_id, presence: true
validates :user_id, uniqueness: {scope: :project_id, :message => "has already been added to this project"}

end
