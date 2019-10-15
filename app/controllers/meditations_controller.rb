class MeditationsController < ApplicationController
  def index 
    @meditations = Meditation.all
  end
  def new
    @meditation = Meditation.new
  end
  def create
    @meditation = Meditation.new(meditation_params)
    return render('new') unless @meditation.save

    redirect_to meditations_path
  end

  private

  def meditation_params
    params.require(:meditation).permit(:name, :meditationFile)
  end
end
