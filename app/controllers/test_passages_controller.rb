class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  
  def show
  end
  
  def update    
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.update_successfull if @test_passage.success?
      distribution_badge
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def distribution_badge
    badges = BadgeService.new(@test_passage).call
    if badges.present?
      current_user.badges << badges
      flash[:notice] = I18n.('Поздравляем!')
    end
  end

  def result
  end

  def gist
    
    service = GistQuestionService.new(@test_passage.current_question)
    gist = service.call
    if service.success?
      Gist.create(user: @test_passage.user, question: @test_passage.current_question, html_url: gist[:html_url])

      flash[:notice] = view_context.link_to t('.success'), gist[:html_url], target: :blank
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
