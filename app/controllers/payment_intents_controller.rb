class PaymentIntentsController < ApplicationController
  before_action :authenticate_user!

  def create
  	#POST request
  	#puts("##################")
  	#puts(params[:email])
  	customer = Stripe::Customer.create(
  		description: 'Setup waba Customer',
  		:email => current_user.email,
      :name => params[:name],
      payment_method: params[:paymentmethod],
      invoice_settings: {
          default_payment_method: params[:paymentmethod],
        }
		)
    # Create a payment intent with the expected amount,
    payment_intent = Stripe::PaymentIntent.create(
      amount: params[:amount],
      currency: 'USD',
      description: "WABA setup charge",
      customer: customer.id,
      receipt_email: "info@rivet.solutions",
      payment_method_types: ['card'],
      statement_descriptor: 'TimeSink submit',
    )
    # return the client secret
    render json: {
      id: payment_intent.id,
      client_secret: payment_intent.client_secret,
      customer_id: customer.id,
      email: current_user.email,
    }
  end
end