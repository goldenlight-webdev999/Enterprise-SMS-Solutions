module ApplicationHelper

  def is_active_page controller, action
    params[:controller] == controller && params[:action] == action ? "active" : nil
  end
end
