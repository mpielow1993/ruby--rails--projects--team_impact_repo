# frozen_string_literal: true

class ApplicationController < ActionController::Base
  
  include SessionsHelper
  include ApplicationHelper

  after_action -> { flash.discard }, if: -> { request.get? }

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


