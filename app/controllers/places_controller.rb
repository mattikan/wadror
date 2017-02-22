require 'beermapping_api'

class PlacesController < ApplicationController
  def index
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end

  def show
    @place = BeermappingApi.find_place(params[:id])
    if @place.empty?
      redirect_to places_path, notice: "There's no such bar"
    else
      render :show
    end
  end

end