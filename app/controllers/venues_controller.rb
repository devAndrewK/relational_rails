class VenuesController < ApplicationController
    def index
        @venues = Venue.only_all_ages
    end

    def new
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

    def destroy
        Venue.destroy(params[:id])
        redirect_to '/venues'
    end

    private

        def venue_params
            params.permit(:name, :city, :all_ages, :capacity)
        end


end