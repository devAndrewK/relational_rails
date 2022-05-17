class VenuesController < ApplicationController
    def index
        @venues = Venue.only_all_ages
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

    def edit
        @venue = Venue.find(params[:id])
        @radio_all_ages_yes = false
        @radio_all_ages_no = false
        if @venue.all_ages
            @radio_all_ages_yes = true
        else
            @radio_all_ages_no = true
        end
    end

    def update
       venue = Venue.find(params[:id])
       venue.update(venue_params)
       redirect_to "/venues/#{venue.id}" 
    end

    def show
        @venue = Venue.find(params[:id])
    end

    private

        def venue_params
            params.permit(:name, :city, :all_ages, :capacity)
        end


end