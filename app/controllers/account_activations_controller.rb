class AccountActivationsController < ApplicationController
    
    #An 'edit' action to activate accounts
    def edit 
        @member = Member.find_by(user_name: params[:user_name]) 
        check_existence(@member, root_url, "Member not found")
        if @member.authenticated?(:activation, params[:id]) 
            #Account activation via the member model object
            @member.activate
            log_in @member 
            flash[:success] = "Account Activated!" 
            redirect_to @member 
        else 
            flash[:danger] = "Invalid Activation Link" 
            redirect_to root_url 
        end 
    end
end
