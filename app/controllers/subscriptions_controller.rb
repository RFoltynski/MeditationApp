class SubscriptionsController < ApplicationController

  def index 
    @subscriptions = Subscription.all
    @userCollections = current_user.collections
   
  end

  def create 
    @subscription = Subscription.create(user_id: current_user.id, collection_id: params[:collection_id])
    @subscription.save
    redirect_to users_path
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    flash[:notice] = "Subskrycja anulowana"
    redirect_to users_path
  end

  private 

  def find_subscription
    @subscription = Subscription.find(params[:id])
  end
end
