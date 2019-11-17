class StoreItemsController < ApplicationController
  def index
    @store_items = StoreItem.all.paginate(page: params[:page])
    @member = current_member
    @order = current_order
    @order_item = @order.order_items.new
  end

  def show
  end

  def create
  end

  def new
  end

  def update
  end

  def edit
  end

  def delete
  end
end
