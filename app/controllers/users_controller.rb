class UsersController < ApplicationController
  before_action :user_params, only: %i[show delete_image_attachment]
  def index
  @collections = Collection.all

  @subscription = Subscription.find_by(user_id: current_user)
  end
  def show
    @user = User.find(params[:id])
  end

  def delete_image_attachment
    @avatar = ActiveStorage::Attachment.find(params[:id])
    @avatar.purge
    redirect_back(fallback_location: request.referer)
  end

  private

  def user_params 
    params.permit(:email, :id, :avatar, :nick)
  end
end
