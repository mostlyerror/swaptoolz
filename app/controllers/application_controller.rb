class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # def after_sign_in_path_for(resource)
  #   if resource.has_role? :admin
  #     admin_root_path
  #   elsif resource.has_role? :front_desk
  #     motels_home_path
  #   end
  # end
end
