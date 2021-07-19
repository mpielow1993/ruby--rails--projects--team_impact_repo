class OrderItemsController < ApplicationController
    before_action :logged_in_member
    
    def index
        @member = current_member
        @order = current_order
        @order_items = current_order.order_items
    end
    
    def create
        @member = current_member
        @order = current_order
        @order_item = @order.order_items.build(order_item_params)
        
        if @order_item.save
            flash[:success] = "Item added successfully"
            session[:order_id] = @order.id
            redirect_to member_live_order_path(@member)
        else
            flash[:danger] = "Failed to add item"
            redirect_to member_live_order_path(@member)
        end
    end
    
    def update
        @member = current_member
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update(order_item_params)
        if @order_item.save
            current_order.update(total: current_order.set_total)
            flash[:success] = "Order Item updated successfully"
            redirect_to member_live_order_path(@member)
        else
            flash.now[:danger] = "Update failed"
            render 'orders/live_order'
        end
    end
    
    def destroy
        @member = current_member
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        if @order_item.destroy
            current_order.update(total: current_order.set_total)
            flash[:success] = "Order Item destroyed successfully"
            redirect_to member_live_order_path(@member)
        else
            flash.now[:danger] = "Update failed"
            render 'orders/live_order'
        end
    end
    
    private
        
        def order_item_params
            params.require(:order_item).permit(:store_item_id, :quantity)
        end
end
