class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test, only: %i[show start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  
  def index 
    @tests = Test.where(completed: true)
  end

  def start

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

end
