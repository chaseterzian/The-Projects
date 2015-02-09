#BT
class CommonQuestionsController < ApplicationController

    def index
      @results = CommonQuestion.create_array
    end
end
