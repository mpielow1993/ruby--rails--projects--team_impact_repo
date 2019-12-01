class StoreItemsController < ApplicationController
  def index
    @store_items = StoreItem.all.paginate(page: params[:page])
    @member = current_member
    @order = current_order
    @order_item = @order.order_items.new
  end

  def show
    @store_item = StoreItem.find(params[:id])
  end

  def create
    @store_item = StoreItem.create(store_item_params)
    if @store_item.save
      flash[:success] = "Store Item successfully created"
      redirect_to store_items_path
    else
      render 'new'
    end
  end

  def new
    @store_item = StoreItem.new
  end

  def update
    @store_item = StoreItem.find(params[:id])
    if @store_item.type == "Membership"
      @store_item.update(membership_params)
    else
      @store_item.update(non_membership_params) 
    end
    if @store_item.save  
      flash[:success] = "Store Item updated successfully"
      redirect_to store_items_path
    else
      render 'edit'
    end
  end

  def edit
    @store_item = StoreItem.find(params[:id])
  end

  def destroy
    @store_item = StoreItem.find(params[:id])
    @store_item.destroy
    flash[:success] = "Store Item successfully destroyed"
    redirect_to store_items_path
  end
  
  private
  
    def membership_params
      params.require(:membership).permit(:type, :name, :description, :price, :store_item_avatar, :remove_store_item_avatar)
    end
    
    def non_membership_params
      params.require(:non_membership).permit(:type, :name, :description, :price, :store_item_avatar, :remove_store_item_avatar)
    end
    
    def store_item_params
      params.require(:store_item).permit(:type, :name, :description, :price, :store_item_avatar, :remove_store_item_avatar)
    end
end
