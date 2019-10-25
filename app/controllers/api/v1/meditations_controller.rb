class Api::V1::MeditationsController < ApplicationController 
  def show 
    @meditation = Meditation.find(params[:id])
  end
end