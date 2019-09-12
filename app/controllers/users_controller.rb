class UsersController < ApplicationController
  before_action :user_params, only: %i[show]
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params 
    params.permit(:email, :id, :avatr, :nick)
  end
end
