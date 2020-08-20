class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    skip_policy_scope
  end

  def create
    @swimming_pool = SwimmingPool.find(params[:swimming_pool_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.swimming_pool = @swimming_pool
    @booking.status = "pending"
    authorize @booking

    if @booking.save
      redirect_to swimming_pool_path(@swimming_pool)
      flash[:notice] = "Booking created. An email has been sent to #{@booking.user.email}!"
    else
      render "swimming_pool/show"
    end
  end

  def edit
    # DO WE ACTUALLY NEED THIS?
    @booking = Booking.find(params[:id])
  end

  def updates
    @booking = Booking.find(params[:id])
    @booking.update(booking_update_params)
  end

  private

  def booking_params
    # Here we might want to add a message and number of people
    params.require(:booking).permit(:date, :message, :number_people)
  end

  def booking_update_params
    params.require(:booking).permit(:status)
  end
end
