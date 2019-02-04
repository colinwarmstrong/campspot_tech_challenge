require 'date'

class Reservation
  attr_reader :start_date, :end_date

  def initialize(reservation_info)
    @start_date = Date.parse(reservation_info[:startDate])
    @end_date = Date.parse(reservation_info[:endDate])
  end
end
