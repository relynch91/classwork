class ArtworksController < ApplicationController
    def index 
        artworks = Artwork.all
         render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        
        if artwork.save!
            render json: artwork
        else 
            render json: Artwork.errors.full_messages, status: 422
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        if artwork 
            render json: artwork 
        else 
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def update
        artwork = Artwork.find(params[:id])
        if user.update(artwork_params)
            render json: artwork
        else 
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
    end

    private

    def artwork_params
        params.require(:artwork, :artwork_id, :viewer_id)
    end

end