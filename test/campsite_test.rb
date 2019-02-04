require 'date'
require_relative 'test_helper.rb'
require_relative '../lib/campsite.rb'

class CampsiteTest < Minitest::Test
  def test_campsite_exists_and_has_correct_attributes
    campsite_info = { id: 1, name: 'Cozy Cabin' }
    campsite = Campsite.new(campsite_info)

    assert_instance_of Campsite, campsite
    assert_equal campsite_info[:id], campsite.id
    assert_equal campsite_info[:name], campsite.name
    assert_equal [], campsite.reservations
  end

  def test_a_campsite_can_add_a_reservation
    campsite_info = { id: 1, name: 'Cozy Cabin' }
    campsite = Campsite.new(campsite_info)

    assert_equal [], campsite.reservations

    reservation_info = {campsiteId: 1, startDate: '2018-06-01', endDate: '2018-06-03'}
    campsite.add_reservation(reservation_info)

    assert_equal 1, campsite.reservations.length
    assert_instance_of Reservation, campsite.reservations.first
    assert_equal Date.parse(reservation_info[:startDate]), campsite.reservations.first.start_date
    assert_equal Date.parse(reservation_info[:endDate]), campsite.reservations.first.end_date
  end
end
