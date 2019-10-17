class MeditationsController < ApplicationController
  def index 
    @meditations = Meditation.all
  end
  def new
    @meditation = Meditation.new
   
    @collections = Collection.all.map{|c| [c.name, c.id]}
  end
  def create
    @meditation = Meditation.new(meditation_params)

    @meditation.collection_id = params[:collection_id]
    return render('new') unless @meditation.save
    redirect_to meditations_path
  end
  def show 
    @meditation = Meditation.find(params[:id])
  end
  def edit 
    @collections = Collection.all.map{|c| [c.name, c.id]}
  end
  def update
    @meditation.collection_id = params[:collection_id]

    if @meditation.update(meditation_params)
      redirect_to meditation_path(@meditation)
    else
      render 'edit'
    end
  end

  private

  def meditation_params
    params.require(:meditation).permit(:name, :meditationFile, :collection_id)
  end
end
