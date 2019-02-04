require 'date'
require_relative 'test_helper.rb'
require_relative '../lib/reservation.rb'

class ReservationTest < Minitest::Test
  def test_reservation_exists_and_has_correct_attributes
    reservation_info = { campsiteId: 1, startDate: '2018-06-01', endDate: '2018-06-03' }

    reservation = Reservation.new(reservation_info)

    assert_instance_of Reservation, reservation
    assert_equal Date.parse(reservation_info[:startDate]), reservation.start_date
    assert_equal Date.parse(reservation_info[:endDate]), reservation.end_date
  end
end
