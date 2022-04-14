class SubscriptionsController < ApplicationController
	before_action :authenticate_user!
	before_action :form_params, only:[:create]

  def index
  end

  def new
  end

  def show
    @submission = Submission.find_by_uuid(params[:id])
  end

  def create
    @submission = Submission.new(form_params)


    @billing = BillingDetail.create(customer_name: params[:name], address: params[:address], city: params[:city], 
      state: params[:state], country: params[:country], postcode: params[:postcode], uuid: SecureRandom.uuid, 
      customer_id: params[:customer_id], payment_id: params[:submission][:stripe_payment_id], nameoncard: params[:cc_name],
      phonenumber: params[:phone], emailid: params[:email])
     
   
    @user = User.find_by(email: params[:email])
    @user.update(stripe_customer_id: params[:customer_id], subscription_status: params[:submission][:status], subscription_id: params[:submission][:subscription_id])

    if @submission.save
      redirect_to @submission
    else
      flash.now[:error] = "Oops, something went wrong with your submission. Please try again!"
      render :new
    end
  end

private
  def form_params
    params.require(:submission).permit(
      :title,
      :stripe_payment_id,
      :status,
      :price,
      :uuid, 
      :subscription_id,
    )
  end
end
