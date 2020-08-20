class SwimmingPoolsController < ApplicationController
  def index
    if params[:query].present?
      @swimming_pools = SwimmingPool.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @swimming_pools = SwimmingPool.all
    end
  end

  # New needs to be abova show
  def new
    @swimming_pool = SwimmingPool.new
  end

  def show
    @swimming_pool = SwimmingPool.find(params[:id])
    @booking = Booking.new
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
