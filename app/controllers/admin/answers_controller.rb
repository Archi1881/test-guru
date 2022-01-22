class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[show new create]
  before_action :set_answer, only: %i[ show edit update destroy ]
  
  def show; end

  def new
    @answer = @question.answer.new
  end

  def edit; end
  
  def create
    @answer = @question.answer.new(answer_params)
    
    if @answer.save
      redirect_to admin_answer_path(@answer), notice: 'Answer was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @answer.update(answer_params)
      redirect_to admin_question_answer_path, success: t('.update_success')
    else
      render :edit      
    end
  end
  
  def destroy
    @answer.destroy
    redirect_to admin_question_answers_path
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end
  
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

end
