class TourVenuesController < ApplicationController
    def index
        tour = Tour.find(params[:tour_id])
        @venues = tour.venues
    end
end