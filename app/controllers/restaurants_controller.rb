class RestaurantsController < ApplicationController
  #before_action : set_restaurant, only : [:show, :edit, :update, :destroy]


  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.create(restaurant_params)
      if @restaurant.save
        redirect_to_restaurant_path(@restaurant)
      else
      render :new
      end
  end

  def edit
  end

  def update
    @restaurant.update(params[:restaurant])
    redirect_to_restaurant_path
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

private
  def set_restaurant
    @restaurant = restaurant.find(params [:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars)
  end
end
