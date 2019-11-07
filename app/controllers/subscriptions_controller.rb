class SubscriptionsController < ApplicationController
  def create 
    @subscription = Subscription.create(user_id: current_user.id, collection_id: params[:collection_id])
    @subscription.save
  end
end
