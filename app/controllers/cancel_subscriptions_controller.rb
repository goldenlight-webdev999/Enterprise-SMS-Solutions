class CancelSubscriptionsController < ApplicationController
	before_action :authenticate_user!

	def cancel_plan
		# cancel_sub = Stripe::Subscription.update(
		#   current_user.subscription_id,
		#   {
		#     cancel_at_period_end: true,
		#   }
		# )
		cancel_sub = Stripe::Subscription.delete(
		  current_user.subscription_id,
		)
		puts("+++++++++++++++++++++")
		puts(cancel_sub)
		if cancel_sub.status == "canceled"
		  flash[:notice] = "Your subscription has been successfully canceled#.".html_safe
		  @user = User.find_by(subscription_id: current_user.subscription_id)
    	  @user.update(subscription_status: cancel_sub.status)

    	  @submission = Submission.find_by(subscription_id: current_user.subscription_id)
    	  @submission.update(status: cancel_sub.status)
    	  redirect_to root_path, notice: "Your WABA subscription has been successfully canceled."
		 else
		  flash[:alert] = "There was an error canceling your subscription. Please notify us#."
		  redirect_to root_path, alert: "There was an error canceling your WABA subscription. Please notify us."
		 end
		 # redirect_to root_path
		
	end	
end
