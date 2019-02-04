class Campsite
  attr_reader :id, :name, :reservations

  def initialize(campsite_info)
    @id = campsite_info[:id]
    @name = campsite_info[:name]
    @reservations = []
  end

  def add_reservation(reservation_info)
    reservation = Reservation.new(reservation_info)
    reservations.push(reservation)
  end
end
