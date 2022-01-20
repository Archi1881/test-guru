class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  
  def show
  end
  
  def update    
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  def gist
    
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call
    @gist = current_user.gists.new(gist_url: result.html_url, user_id: current_user.id, question_id: @test_passage.current_question.id)
    
    flash_options = service.success? && @gist.save ? { notice: t('.success')} : { alert: t('.failure')}
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
