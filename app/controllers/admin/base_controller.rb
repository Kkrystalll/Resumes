# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :check_permission

    private

    def check_permission
      available_role = %w[admin staff]
      redirect_to root_path unless user_signed_in? && current_user.role.in?(available_role)
    end
  end
end
