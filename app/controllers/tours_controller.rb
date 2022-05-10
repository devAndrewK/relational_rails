class ToursController < ApplicationController
    def index
        @tours = Tour.all
    end

    def new
    end

    def create
        tour = Tour.new({
            name: params[:tour][:name],
            created_at: Time.now,
            updated_at: Time.now,
            sold_out: false,
            merch_on_hand: 100
            })
      
          tour.save
      
          redirect_to '/tours'
    end
end