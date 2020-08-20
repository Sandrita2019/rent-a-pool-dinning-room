class SwimmingPoolsController < ApplicationController
  def index
    if params[:query].present?
      @swimming_pools = SwimmingPool.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @swimming_pools = SwimmingPool.all
    end
    @swimming_pools = policy_scope(SwimmingPool)
  end

  # New needs to be abova show
  def new
    @swimming_pool = SwimmingPool.new
  end

  def show
    @swimming_pool = SwimmingPool.find(params[:id])
    @booking = Booking.new
    authorize @swimming_pool
  end

  def create
    @swimming_pool = SwimmingPool.new(swimming_pool_params)
    authorize @swimming_pool

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
