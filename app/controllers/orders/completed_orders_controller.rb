class Orders::CompletedOrdersController < ApplicationController
  before_action :logged_in_member, :correct_member
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
    @member = Member.find(params[:member_id])
    @completed_orders = @member.orders.where(is_paid: true)
  end

  def show
    @completed_order = Order.find(params[:id])
  end

  def delete
  end
end
