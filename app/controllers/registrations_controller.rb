class RegistrationsController < Devise::RegistrationsController

  prepend_before_action :have_access?, only: [:new,:create]



protected

  def have_access?
     redirect_to root_path, alert: 'Access Denied' unless user_signed_in? and is_admin?
  end

end