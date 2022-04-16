class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :user_signed_in?, :current_user

  private
    def not_found
      render file: "#{Rails.root}/public/not_found.html",
            status: 404, 
            layout: false
    end

    def user_signed_in?
      # session[:session] != nil
      session[:session].present?
    end
  
    def current_user
      # User.find(session[:session])
      User.find_by(id: session[:session])
    end

    def authenticate_user
      if not user_signed_in?
        redirect_to sign_in_users_path
      end
    end
end
