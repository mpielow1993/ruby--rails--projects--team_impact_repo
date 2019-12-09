class Orders::CompletedOrdersController < ApplicationController
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
