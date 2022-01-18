module ApplicationHelper
  
  FLASH_TYPES = {
    notice: 'alert-info',
    error: 'alert-danger',
    success: 'alert-success'
  }
  
  def current_date
    Time.current.to_date
  end
  
  def github_url(nickname, repository)
    link_to 'GitHub', "https://github.com/#{nickname}/#{repository}", target: :blank
  end

  def flash_messages(type)
    content_tag :div, flash[type] ,class: "alert #{FLASH_TYPES.fetch(type.to_sym, type)}" if flash[:type]
  end
end
 