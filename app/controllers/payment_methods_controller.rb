class PaymentMethodsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    
    user = current_user
    user.configs = {stripe_token: customer.id}
    user.save
    
    redirect_to root_path
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
