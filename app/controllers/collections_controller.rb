class CollectionsController < ApplicationController
  def new 
    @collection = Collection.new
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.new(collection_params)
    return render('new') unless @collection.save
    redirect_to @collection
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to users_path
  end

  private

  def collection_params 
  params.require(:collection).permit(:name, :description)
  end

end