module Api
  module V1
    class PlacesController < ApplicationController
      def index
        places = Place.all
        render json: { status: 'SUCCESS', message: 'Places loaded', data: places }, status: :ok
      end

      def show
        place = Place.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Place loaded', data: place }, status: :ok
      end

      def create
        place = Place.new(place_params)

        if place.save
          render json: {status: 'SUCCESS', message:'Saved place', data: place}, status: :ok
        else
          render json: {status: 'ERROR', message:'Place not saved', data: place.errors},status: :unprocessable_entity
        end
      end

      def destroy
        place = Place.find(params[:id])
        place.destroy
        render json: {status: 'SUCCESS', message:'Deleted place', data: place},status: :ok
      end

      def update
        place = Place.find(params[:id])
        if place.update_attributes(place_params)
          render json: {status: 'SUCCESS', message:'Updated place', data: place},status: :ok
        else
          render json: {status: 'ERROR', message:'place not updated', data: place.errors},status: :unprocessable_entity
        end
      end

      private

      def place_params
        params.permit(:borough,
                      :kind,
                      :name,
                      :address,
                      :zip,
                      :city,
                      :province,
                      :phone,
                      :website,
                      :lng,
                      :lat,
                      :description,
                      :collection_name_fr,
                      :collection_name_en,
                      :category_fr,
                      :category_en,
                      :sub_category_fr,
                      :sub_category_en,
                      :materials_fr,
                      :materials_en,
                      :tech_fr,
                      :tech_en,
                      :artist_name,
                      :artist_last_name,
                      :park,
                      :building,
                      :type,
                      :artist,
                      :organisation,
                      :year,
                      :program,
                      :image
        )
      end

      def set_place
        @place = Place.find(params[:id])
      end
    end
  end
end
