class SwimmingPoolsController < ApplicationController
  def index
    @swimming_pools = SwimmingPool.all
  end

  # New needs to be abova show
  def new
    @swimming_pool = SwimmingPool.new
  end

  def show
    @swimming_pool = SwimmingPool.find(params[:id])
  end

  def create
    @swimming_pool = SwimmingPool.new(swimming_pool_params)

    if @swimming_pool.save
      redirect_to swimming_pool_path(@swimming_pool)
    else
      render :new
    end
  end

  private

  def swimming_pool_params
    params.require(:swimming_pool).permit(:capacity, :location, :size)
  end
end
