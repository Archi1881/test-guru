module ApplicationHelper
  
  def current_date
    Time.current.to_date
  end
  
  def github_url(nickname, repository)
    link_to 'GitHub', "https://github.com/#{nickname}/#{repository}", target: :blank
  end
end
 