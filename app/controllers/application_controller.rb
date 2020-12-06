class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper

  protected

    # Filter method
    # UNIT TEST
    def search(relation, params)
      return relation if params.empty?
      relation.where(params)
    end

    # Define parameters required by the user to save record
    def set_required_params(search_param_keys_array)
      params.fetch(
        controller_name.classify.to_s.underscore.to_sym, 
        *controller_name.classify.constantize.fields
        ).permit(search_param_keys_array)  
    end

    # Define parameters used in Filter method
    def set_search_params(search_param_keys_array)
      params.fetch(
        controller_name.classify.to_s.underscore.to_sym, 
      *controller_name.classify.constantize.fields
      ).permit(search_param_keys_array)
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
