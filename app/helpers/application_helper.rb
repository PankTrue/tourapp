module ApplicationHelper


  def is_admin?
     current_user.role_id == 0 ? true : false
  end

end
