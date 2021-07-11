class SubscriptionsController < ApplicationController
  before_action :logged_in_member, :correct_member
  
  def index
    @member = Member.find(params[:member_id])
    @subscriptions = @member.subscriptions.paginate(page: params[:page])
  end

  def show
    @member = Member.find(params[:member_id])
    @subscription = Subscription.find(params[:id])
    @registrations = @subscription.registrations.paginate(page: params[:page])
  end

  #def create
  #end

  #def new
  #end

  #def update
  #end

  #def edit
  #end

  def destroy
    @member = Member.find(params[:member_id])
    @subscription = @member.subscriptions.find(params[:id])
    @subscription.destroy
    flash[:success] = "Subscription successfully removed"
    params[:show_header_alert_message] = true
    redirect_to member_subscriptions_path(@member)
  end

end
