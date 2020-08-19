class SwimmingPoolsController < ApplicationController
  def index
    @swimming_pools = Swimming_pool.all
  end

  def show
    @swimming_pool = Swimming_pool.find(params[:id])
  end

  def new
    @swimming_pool = Swimming_pool.new
  end

  def create
    @swimming_pool = Swimming_pool.new(swimming_pool_params)
    if @swimming_pool.save
      redirect_to swimming_pool_path(@swimming_pool)
    else
      render 'new'
    end
  end

  private

  def swimming_pool_params
    params.require(:swimming_pool).permit(:capacity, :location, :size)
  end
end
