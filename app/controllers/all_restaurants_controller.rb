class AllRestaurantsController < ApplicationController
  before_action :find_all_restaurant, only: [:show]
  def index
    @all_restaurants = AllRestaurant.all
    render json: @all_restaurants
  end

  def show
    render json: @all_restaurant
  end

  private

  def find_all_resstaurant
    @all_restaurant = AllRestaurant.find(params[:id])
  end
end
