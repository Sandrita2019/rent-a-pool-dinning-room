class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @swimming_pool = Swimming_pool.find(params[:swimming_pool_id])
    @booking = Booking.new(booking_params)
    @booking.swimming_pool = @swimming_pool

    if @booking.save
      redirect_to swimming_pool_path(@swimming_pool)
    else
      render "swimming_pool/show"
    end
  end

  def edit
    # DO WE ACTUALLY NEED THIS?
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_update_params)
  end

  private

  def booking_params
    # Here we might want to add a message and number of people
    params.require(:booking).permit(:date)
  end

  def booking_update_params
    params,require(:booking).permit(:status)
  end
end
