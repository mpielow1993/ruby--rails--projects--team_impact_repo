class ChargesController < ApplicationController
def new
  @member = current_member
  @order = current_order
end

def create
  @member = current_order.member
  @live_order = current_order
  # Amount in euros
  @amount = (@live_order.total * 100).round

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: "Order for #{@member.first_name}" + " " + "#{@member.last_name}",
    currency: 'eur',
    receipt_email: "#{@member.email}"
  })

@live_order.is_paid = true

@subscriptions = 0

if @live_order.save
  @live_order.order_items.each do |order_item|
    if order_item.is_membership?
      subscription = order_item.membership.subscriptions.build(member_id: @member.id, is_active: true)
      subscription.save
      @subscriptions += 1
    end
  end
  flash[:success] = "Payment Completed. #{@subscriptions} Membership Subscriptions added to your account"
  redirect_to store_items_path
  session[:order_id] = nil
else
  flash[:danger] = "Something went wrong. Please try again"
  redirect_to store_items_path
end




rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

def index
  @member = current_member
  @order = current_order
end
end
