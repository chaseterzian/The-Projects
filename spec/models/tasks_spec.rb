require 'rails_helper'

  describe Task do

    it 'Confirms the presence of a description for a new task' do

      task = Task.new(description: 'Description Validation')
      expect(task).to be_valid
    end

    it 'Confirms the presence of a validation message when no description is entered' do

      task = Task.new(description: '')
      task.valid?
      expect(task.errors[:description]).to include("can't be blank")
    end

  end
