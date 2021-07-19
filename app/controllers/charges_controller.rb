class ChargesController < ApplicationController
  before_action :logged_in_member

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
  @subscription_count = 0

  if @live_order.save
    @live_order.order_items.each do |order_item|
      if order_item.store_item.type == "Membership"
        order_item.quantity.times do |n|
          subscription = order_item.store_item.subscriptions.build(member_id: @member.id, is_active: true)
          subscription.save
          @subscription_count += 1
        end
      end
    end
    flash[:success] = "Payment Completed. #{@subscription_count} Membership Subscription(s) added to your account"
    redirect_to store_items_path, show_header_alert_message: true
    session[:order_id] = nil
  else
    flash[:danger] = "Something went wrong. Please try again"
    redirect_to store_items_path, show_header_alert_message: true
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
