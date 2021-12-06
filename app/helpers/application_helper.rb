module ApplicationHelper
    
    TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard}.freeze
  
    def current_year
    Time.current.year
  end
  
  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
  
  def github_url(nickname, repository)
    link_to 'GitHub', "https://github.com/#{nickname}/#{repository}", target: :blank
  end
end
 