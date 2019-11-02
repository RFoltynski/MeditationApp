class MeditationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_meditation, only: %i[show destroy edit update]
  before_action :meditation_params, only: %i[create update]
  before_action :set_collections, only: %i[new create edit update]
  def index
    @meditations = Meditation.all
  end

  def new
    @meditation = Meditation.new
  end

  def create
    @meditation = Meditation.new(meditation_params)
    @meditation.collection_id = params[:collection_id]
    if @meditation.save
      flash[:notice] = 'Medytacja została dodana.'
      redirect_to meditations_path
    else 
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    @meditation.collection_id = params[:collection_id]
    if @meditation.update(meditation_params)
      flash[:notice] = 'Medytacja została edytowana.'
      redirect_to meditations_path
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

  def set_collections
    @collections = Collection.all.map { |c| [c.name, c.id] }
  end
end
