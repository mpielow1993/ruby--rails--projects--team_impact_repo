class OrdersController < ApplicationController
  before_action :logged_in_member, :correct_member

  def live_order
    @member = current_member
    @order = current_order
    @order_items = current_order.order_items.paginate(page: params[:page]).per_page(5)
  end

  def show
    @order = Order.find(params[:id])
    check_existence(@order, member_orders_path, "Order not found")
    @order_items = @order.order_items.paginate(page: params[:page]).per_page(5)
  end
  
  def index
    @member = Member.find(params[:member_id])
    @orders = @member.orders.where(is_paid: true).paginate(page: params[:page]).per_page(5)
  end

  def create_live_order
    @member = current_member
    @order = @member.orders.build
    if @order.save
      flash[:success] = "New Order created successfully"
      session[:order_id] = @order.id
      redirect_to store_items_path
    else
      flash[:danger] = "New Order creation failed"
      redirect_to store_items_path
    end
  end

  def edit
  end

  def update
  end

  def destroy_live_order
    @member = current_order.member
    @order = current_order
    if @order.destroy
      flash[:success] = "Order successfully deleted"
      session[:order_id] = nil
      redirect_to store_items_path
    else
      flash.now[:danger] = "An error occurred deleting the selected order. Please try again."
      render 'orders/show'
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    check_existence(@order, member_orders_path, "Order not found")
    if @order.destroy
      flash[:success] = "Your order has been successfully destroyed"
      redirect_to member_orders_path
    else
      flash.now[:danger] = "An error occurred deleting the selected order"
      render 'orders/show'
    end
  end
  
  private 
  
    def order_params
      params.require(:order).permit(:member_id)
    end
end
