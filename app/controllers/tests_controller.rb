class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test, only: %i[show start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  
  def index 
    @tests = Test.all
  end

  def start

    if @test.completed
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, warning: 'Нет доступа к тесту!'
    end

=begin
    if @test.questions.count > 0
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, warning: 'Нет доступа к тесту!'
    end
=end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

end
