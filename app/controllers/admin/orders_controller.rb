class Admin::OrdersController < Admin::AdminApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.paginate(page: params[:page])
  end

  def index
    @orders = Order.all.where(is_paid: true).paginate(page: params[:page]).per_page(5)
  end

  def new
  end

  def create
    @member = current_member
    @order = @member.orders.build
    if @order.save
      flash[:success] = "New Order created successfully"
      params[:show_header_alert_message] = true
      session[:order_id] = @order.id
      redirect_to store_items_path
    else
      flash[:danger] = "New Order creation failed"
      params[:show_header_alert_message] = true
      redirect_to store_items_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @member = current_order.member
    @order = current_order
    if @order.destroy
      flash[:success] = "Order successfully destroyed"
      params[:show_header_alert_message] = true
      session[:order_id] = nil
      redirect_to store_items_path
    else
      flash[:danger] = "Order removal failed"
      params[:show_header_alert_message] = true
      render 'orders/show'
    end
  end

  private

    #def order_params
     # params.require(:order).permit(:member_id)
    #end
end
