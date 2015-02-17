class MapsController < ApplicationController

  respond_to :json

  def index
    @start = [42.013157, -87.662274]
    @end = [41.709978, -87.589064]
  end

  # def search
  #   geometry = params['features'][0]['geometry']
  #   @attractions = Attraction.search_within(geometry).all.to_a
  #   render json: { attractions: @attractions }
  # end

  def search
    geometry = params['features'][0]['geometry']
    if current_user
      interests = current_user.interests
      @attractions = Attraction.search_within(geometry, interests)
    else
      @attractions = Attraction.search_within(geometry)
    end
    render json: { attractions: @attractions }
  end

  def directions
  end

end



#from console this works: u.interests.each { |interest| p interest.attractions }
#displays all the business names: u.interests.each { |intr| p intr.attractions.each { |attr| p attr.name } }
