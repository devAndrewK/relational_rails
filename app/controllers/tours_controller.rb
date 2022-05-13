class ToursController < ApplicationController
    def index
        @tours = Tour.all.sort_by{ |tour| tour.created_at }.reverse
    end

    def new
    end

    def create
        tour = Tour.new({
            name: params[:tour][:name],
            created_at: Time.now,
            updated_at: Time.now,
            sold_out: params[:sold_out],
            merch_on_hand: params[:merch_on_hand]
            })
      
          tour.save
      
          redirect_to '/tours'
    end

    def show
        @tour = Tour.find(params[:id])
        @venues = Venue.where(tour_id: @tour.id)
    end
end