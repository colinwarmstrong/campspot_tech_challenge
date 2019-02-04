class Reservation
  attr_reader :start_date, :end_date

  def initialize(reservation_info)
    @start_date = reservation_info[:startDate]
    @end_date = reservation_info[:endDate]
  end
end
