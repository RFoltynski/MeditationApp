class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_collection, only: %i[show destroy edit update]
  def new 
    @collection = Collection.new
  end

  def show 
    @meditations = @collection.meditations
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save 
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit; end

  def update 
    if @collection.update(collection_params) 
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @collection.destroy
    redirect_to users_path
  end

  private

  def collection_params 
    params.require(:collection).permit(:name, :description)
  end

  def find_collection
    @collection = Collection.find(params[:id])
  end
end
