class SubscriptionsController < ApplicationController
  def index 
    @subscriptions = Subscription.all
  end

  def create 
    @subscription = Subscription.create(user_id: current_user.id, collection_id: params[:collection_id])
    @subscription.save
  end

  def destroy
    collection = Collection.find(params[:id])
    @subscription = Subscription.where(user_id: current_user.id, collection_id: collection.id).first
    @subscription.destroy
    flash[:notice] = "Subskrycja anulowana"
    redirect_to users_path
  end
end
