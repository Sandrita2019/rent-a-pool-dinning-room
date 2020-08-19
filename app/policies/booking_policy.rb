class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    record.user == user
  end
end

# @bookings.each do |booking|
#     if policy(booking).show?
#        link_to "Update", edit_booking_path(booking)
#     else
#       redirect_to root_path
#     end
#   end
