class CollectionsController < ApplicationController
  before_action :find_collection, only: %i[show destroy]
  def new 
    @collection = Collection.new
  end

  def show 
    @meditations = @collection.meditations
  end

  def create
    @collection = Collection.new(collection_params)
    return render('new') unless @collection.save
    redirect_to @collection
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