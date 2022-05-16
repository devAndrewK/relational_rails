class ToursController < ApplicationController
    def index
        @tours = Tour.order_recent
    end

    def new
    end

    def create
        binding.pry
        tour = Tour.create(name: params[:name],
                            merch_on_hand: params[:merch_on_hand],
                            sold_out: false)
      
        redirect_to "/tours"
    end

    def show
        @tour = Tour.find(params[:id])
        @venues = Venue.where(tour_id: @tour.id)
    end

    def destroy
        Tour.destroy(params[:id])
        redirect_to '/tours'
    end
end