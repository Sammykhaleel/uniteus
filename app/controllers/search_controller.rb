class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @educations = []
    else
      @educations = Education.search params[:q]
    end
    @hash = Gmaps4rails.build_markers(@educations) do |education, marker|
      marker.lat education.latitude
      marker.lng education.longitude
      marker
    end
  end
end
