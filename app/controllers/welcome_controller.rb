class WelcomeController < ApplicationController
  require "stripe"

  def index
    if current_user and current_user.configs and current_user.configs['stripe_token']
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      @stripe_user = Stripe::Customer.retrieve(current_user.configs['stripe_token'])
      @stripe_source = @stripe_user.sources.find{ |s| s.id == @stripe_user.default_source }
    end
  end
end
