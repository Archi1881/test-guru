class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, only: %i[show edit update destroy]  
  before_action :find_test, only: %i[new create]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: @question.inspect
    else
      render plain: 'Error on create'
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test), success: t('.update_success')
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), notice: t('.delete')
  end
  
  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
