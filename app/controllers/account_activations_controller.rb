class AccountActivationsController < ApplicationController
    
    #An 'edit' action to activate accounts
    def edit 
        member = Member.find_by(email: params[:email]) 
        if member && !member.activated? && member.authenticated?(:activation, params[:id]) 
            #member.update_attribute(:activated, true) 
            #member.update_attribute(:activated_at, Time.zone.now) 
            
            #Account activation via the member model object
            member.activate
            log_in member 
            flash[:success] = "Account Activated!" 
            redirect_to member 
        else 
            flash[:danger] = "Invalid Activation Link" 
            redirect_to root_url 
        end 
    end
end
