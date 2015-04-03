require 'spec_helper'

describe Project do

  it 'Confirms the presence of a project name'  do

    project = Project.create!(
    name: 'Existing Project')
    expect(project).to be_valid
  end

  it 'Confirms the presence of a validation - user must enter a project name' do

    project = Project.create(
    name: '')
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")  #works without bang, but not with
  end

end
