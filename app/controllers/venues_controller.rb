class VenuesController < ApplicationController
    def index
        @venues = Venue.all
    end

    def new
    end

    def create
        venue = Venue.new({
            name: params[:venue][:name],
            created_at: Time.now,
            updated_at: Time.now,
            all_ages: false,
            capacity: 100
            })
      
          venue.save
      
          redirect_to '/venues'
    end

    def show
        @venue = Venue.find(params[:id])
    end
end