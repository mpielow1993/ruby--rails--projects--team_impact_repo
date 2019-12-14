class StoreItemsController < ApplicationController
  before_action :logged_in_member
  
  def index
    @store_items = StoreItem.all.paginate(page: params[:page])
    @memberships = StoreItem.where(type: "Membership").paginate(page: params[:page])
    @non_memberships = StoreItem.where(type: "NonMembership").paginate(page: params[:page])
    @member = current_member
    @order = current_order
    @order_item = @order.order_items.new
  end

end
