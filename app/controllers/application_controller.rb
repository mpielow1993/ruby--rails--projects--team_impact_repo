# frozen_string_literal: true

class ApplicationController < ActionController::Base

  include SessionsHelper
  include ApplicationHelper

  protected

    # Check for the existence of defined entity, redirect on failure
    def check_existence(entity, redirect_path, error_message = "Entity not found")
      if entity.nil?
        flash[:danger] = error_message
        redirect_to redirect_path
      end
    end

  private

    # Confirms a logged-in member.
    def logged_in_member
      unless logged_in?
        # Adding store_location to the logged-in-user before-ﬁlter
        store_location
        flash[:danger] = 'Please log in.'
        redirect_to log_in_url
      end
    end

    # Confirms the correct member.
    def correct_member
      if !params[:member_id].nil?
        @member = Member.find(params[:member_id])
      else
        @member = Member.find(params[:id])
      end
      redirect_to(root_url) unless current_member?(@member)
    end

    # Confirms an admin member.
    def admin_member
      redirect_to(root_url) unless current_member.admin?
    end
end


