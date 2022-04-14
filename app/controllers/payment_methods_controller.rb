class PaymentMethodsController < ApplicationController
	before_action :authenticate_user!
	
  def create
  	#POST request
  	# puts("##################")
  	# puts(current_user.email)
  	# puts(current_user.inspect)
  	#puts(params[:email])
    # puts("+++++++++++++++++++++++++++")
    # puts(ENV['price'])
  	customer = Stripe::Customer.create(
  		description: 'Subscription Customer payment',
  		:email => current_user.email,
        :name => params[:name],
        payment_method: params[:paymentmethod],
        invoice_settings: {
        	default_payment_method: params[:paymentmethod],
        }
		)
  	 subscription = Stripe::Subscription.create(
      customer: customer.id,
      items: [{ price: ENV['price'] }],
      expand: %w[latest_invoice.payment_intent],
    )

    # Create a payment intent with the expected amount,
    # payment_intent = Stripe::PaymentIntent.create(
    #   amount: params[:amount],
    #   currency: 'usd',
    #   description: "Order for ",
    #   customer: customer.id,
    #   receipt_email: "pmid@gmail.com",
    #   payment_method_types: ['card'],
    #   statement_descriptor: 'TimeSink submit',
    # )
    # return the client secret
    

    render json: {
      # id: payment_intent.id,
      # client_secret: payment_intent.client_secret,
      status: subscription['latest_invoice']['payment_intent']['status'],
      client_secret: subscription['latest_invoice']['payment_intent']['client_secret'],
      customer_id: customer.id,
      subscription_id: subscription.id,
      email: current_user.email,
    }
  end
end