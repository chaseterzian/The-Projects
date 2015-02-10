class CommonQuestionsController < ApplicationController

  def common_questions
    answers = CommonQuestion.get_question_answer
    slugs = CommonQuestion.get_slug
    @faqs=[slugs, answers]
  end

end
