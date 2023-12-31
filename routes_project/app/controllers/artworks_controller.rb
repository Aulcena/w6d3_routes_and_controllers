class ArtworksController < ApplicationController

    def index

        if params[:user_id]
            render json: Artwork.artworks_for_user_id(params[:user_id])
        else
            render json: Artwork.all
        end
  
    end

    def create

        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: :created
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    def show

        artwork = Artwork.find_by(id: params[:id])

        render json: artwork
    end

    def update

        artwork = Artwork.find_by(id: params[:id])

        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    def destroy

        artwork = Artwork.find_by(id: params[:id])
        
        if artwork.destroy
            render json: :deleted
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end