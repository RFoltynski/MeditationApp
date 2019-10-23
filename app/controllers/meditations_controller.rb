class MeditationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_meditation, only: %i[show destroy edit]
  before_action :meditation_params, only: %i[create update]
  def index
    @meditations = Meditation.all
  end

  def new
    @meditation = Meditation.new
    @collections = Collection.all.map{ |c| [c.name, c.id] }
  end

  def create
    @meditation = Meditation.new(meditation_params)
    @meditation.collection_id = params[:collection_id]
    return render('new') unless @meditation.save
    redirect_to meditations_path
  end

  def show; end

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

  def destroy
    @meditation.destroy
    redirect_to meditations_path
  end

  private

  def meditation_params
    params.require(:meditation).permit(:name, :meditationFile, :collection_id)
  end

  def find_meditation
    @meditation = Meditation.find(params[:id])
  end
end
