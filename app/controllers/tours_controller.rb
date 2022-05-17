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
                            sold_out: params[:sold_out])
      
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

    def edit
        @tour = Tour.find(params[:id])
    end

    def update
       tour = Tour.find(params[:id])
       tour.update(tour_params)
       redirect_to '/tours' 
    end

    private
        def tour_params
            params.permit(:name, :merch_on_hand, :sold_out)
        end
end