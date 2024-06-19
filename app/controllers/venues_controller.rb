class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venue = matching_venues.order(:created_at)
    render({ :template => "venue_templates/venue_list" })

  end

  def show
    venue_id = params.fetch("path_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.first

    if @the_venue == nil
      redirect_to("/venues", { :notice => "unable to fetch venue details." })
    else
      
      render({ :template => "venue_templates/details" })

    end

  end

  def create
    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end
  
  def update
    the_id = params.fetch("the_id")
    edit_address = params.fetch("query_address")
    edit_name = params.fetch("query_name")
    edit_neighborhood = params.fetch("query_neighborhood")
    venue = Venue.where({ :id => the_id }).first

    venue.address = edit_address
    venue.name = edit_name
    venue.neighborhood = edit_neighborhood
    
    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues.at(0)
    venue.destroy

    redirect_to("/venues")
  end

end
