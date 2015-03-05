class Project < ActiveRecord::Base

  validates :project_name, presence: true

end
