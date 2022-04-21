class Admin::BaseController < ApplicationController
  before_action :check_permission

  private
    def check_permission
      available_role = ["admin","staff"]
      if not (user_signed_in? && current_user.role.in?(available_role))
      redirect_to root_path 
      end
    end
end