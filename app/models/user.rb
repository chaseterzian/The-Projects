class User < ActiveRecord::Base

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true
  validates :email, uniqueness:true

  has_many :memberships, :dependent => :destroy
  has_many :projects, through: :memberships
  has_many :comments, :dependent => :nullify

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin_owner?(project)
    self.admin || self.memberships.find_by(project_id: project.id).role == 'Owner'
  end

  def admin_member?(project)
    self.admin || self.memberships.find_by(project_id: project.id) != nil
  end


  has_secure_password

end
