module TestPassagesHelper
    
  def result_color(percent)
    if @test_passage.score_positive?
      "<h2 style='color: green'>You answered #{percent}% questions. 
      Test successfully passed!</h2>".html_safe
    else
      "<h2 style='color: red'>You answered #{percent}% questions. 
      Test failed!</h2>".html_safe
    end
  end
end
