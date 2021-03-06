class TourVenuesController < ApplicationController
    def index
        if !params[:threshold]
            params[:threshold] = 0
        end
        tour = Tour.find(params[:tour_id])
        @venues = tour.venues.order(params[:sort]).
        where("capacity > #{params[:threshold]}")
    end

    def new
    end

    def create
        tour = Tour.find(params[:tour_id])
        tour.venues.create!(tour_venue_params)
        redirect_to "/tours/#{tour.id}/venues"
    end

    private
        def tour_venue_params
            params.permit(:name, :city, :capacity, :all_ages)
        end


end