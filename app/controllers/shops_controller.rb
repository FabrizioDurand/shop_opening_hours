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
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shops_params)
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to(shops_path)
  end

  private

  def shops_params
    params.require(:shop).permit(:name, schedules_attributes: [:id, :open_at, :close_at, :weekday, :closed, :multiple_slots, :open_at_ms, :close_at_ms])
  end
end
