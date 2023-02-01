class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]

  def index
    @shops = Shop.all
  end

  def show
    @schedules_array = []
    # we save all schedules attributes of a shop in schedules_array
    # to manipulate it in the view
    @shop.schedules.each do |sh|
      @schedules_array << sh
    end
  end

  def new
    @shop = Shop.new
    # Using this way (instead of an iteration directly in the view),
    # we correct the new form duplication in Shop new when validation error
    7.times { @shop.schedules.build }
  end

  def create
    @shop = Shop.new(shops_params)
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @shop.update(shops_params)
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop.destroy
    redirect_to(shops_path)
  end

  private

  def shops_params
    params.require(:shop).permit(:name, schedules_attributes: %i[id open_at close_at weekday closed multiple_slots open_at_ms close_at_ms])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
