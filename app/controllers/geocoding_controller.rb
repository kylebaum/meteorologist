require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords_form
    # Nothing to do here.
    render("geocoding/street_to_coords_form.html.erb")
  end

  def street_to_coords
    @street_address = params[:user_street_address]
    @street_address_without_spaces = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the variable @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the variable @street_address_without_spaces.
    # ==========================================================================

    parsed_data = JSON.parse(open("http://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address.to_s).read)

  @lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
  @lng = parsed_data["results"][0]["geometry"]["location"]["lng"]


    @latitude = @lat

    @longitude = @lng

    render("geocoding/street_to_coords.html.erb")
  end
end
