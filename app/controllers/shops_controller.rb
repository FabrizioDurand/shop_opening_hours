class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @schedules_array = []
    @shop.schedules.each do |sh|
      @schedules_array << sh
    end
  end

  def new
    @shop = Shop.new
    @shop.schedules.build
  end

  def create
    @shop = Shop.new(shops_params)
    if @shop.save
      redirect_to shops_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shops_params
    params.require(:shop).permit(:name, schedules_attributes: [:open_at, :close_at, :weekday, :closed, :multiple_slots, :open_at_ms, :close_at_ms])
  end
end
