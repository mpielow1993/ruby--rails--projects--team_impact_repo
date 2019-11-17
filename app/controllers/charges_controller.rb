class ChargesController < ApplicationController
def new
  @member = current_member
  @order = current_order
end

def create
  @member = current_order.member
  @order = current_order
  # Amount in euros
  @amount = (@order.total * 100).round

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

@order.is_paid = true

@subscriptions = []

if @order.save
  @order.order_items.each do |order_item|
    if order_item.is_membership?
      @subscription = order_item.store_item.subscriptions.build(member_id: @member.id, is_active: true)
      @subscriptions.push(@subscription)
      
      @subscriptions.each do |subscription|
        subscription.save
      end
    end
  end
  flash[:success] = "Payment Completed. #{@subscriptions.count} Membership Subscriptions added to your account"
  redirect_to store_items_path
  session[:order_id] = nil
else
  flash[:danger] = "Something went wrong. Please try again"
  redirect_to store_items_path
end




rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_member_order_charge_path(@member, @order)
end

def index
  @member = current_member
  @order = current_order
end
end
