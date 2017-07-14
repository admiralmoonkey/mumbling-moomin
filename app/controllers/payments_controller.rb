class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @product.price, # amount in cents, again
        currency: "usd",
        source: token,
        receipt_email: params[:stripeEmail],
        description: "Product: #{@product.name}, description:#{@product.description}, customer email: #{params[:stripeEmail]}"
      )

      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
        UserMailer.success_order(@user, @product).deliver_now
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

    rescue Stripe::RateLimitError => e
    # Too many requests made to the API too quickly
    rescue Stripe::InvalidRequestError => e
    # Invalid parameters were supplied to Stripe's API
    rescue Stripe::AuthenticationError => e
    # Authentication with Stripe's API failed
    # (maybe you changed API keys recently)
    rescue Stripe::APIConnectionError => e
    # Network communication with Stripe failed
    rescue Stripe::StripeError => e
    # Display a very generic error to the user, and maybe send
    # yourself an email
    rescue => e
      # Something else happened, completely unrelated to Stripe

    end

  end


end
