class SubscriptionsController < ApplicationController
  def index
    @member = Member.find(params[:member_id])
    @subscriptions = Array.wrap(@member.subscriptions)
  end

  def show
    @member = Member.find(params[:member_id])
    @subscription = Subscription.find(params[:subscription_id])
    @registrations = Array.wrap(@subscription.registrations)
  end

  def create
  end

  def new
  end

  def update
  end

  def edit
  end

  def destroy
    @member = Member.find(params[:member_id])
    @subscription = @member.subscriptions.find(params[:id])
    @subscription.destroy
    flash[:success] = "Subscription successfully removed"
    redirect_to member_subscriptions_path(@member)
  end
  
  private
  
    #def subscription_params
      #params.require(:subscription).permit()
    #end
end
