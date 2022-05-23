class QuestionsController < ApplicationController
  def ask
    # this is an empty method
  end

  def answer
    @question = params[:question]
    @answer = coach_answer_enhanced(@question)
  end

  def coach_answer(your_message)
    if your_message == 'I am going to work right now!'
      'Great!'
    elsif your_message.include?('?')
      'Silly question, get dressed and go to work!'
    else
      'I don\'t care, get dressed and go to work!'
    end
  end

  def coach_answer_enhanced(your_message)
    enhance = 'I can feel your motivation! '
    case your_message
    when your_message.include?('I am going to work right now!'.upcase)
      'Great!'
    when your_message == your_message.upcase
      enhance + coach_answer(your_message)
    else coach_answer(your_message)
    end
  end
end
