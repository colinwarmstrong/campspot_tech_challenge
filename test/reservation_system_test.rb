require_relative 'test_helper.rb'
require_relative '../lib/reservation_system.rb'

class ReservationSystemTest < Minitest::Test
  def test_reservation_system_exists_and_has_correct_attributes
    file_path = './test-case.json'
    reservation_system = ReservationSystem.new(file_path)

    assert_instance_of ReservationSystem, reservation_system
    assert_instance_of Hash, reservation_system.data
  end

  def test_reservation_system_can_parse_json_files
    file_path = './test-case.json'
    reservation_system = ReservationSystem.new(file_path)

    data = reservation_system.data

    assert_instance_of Hash, data
    assert_instance_of Hash, data[:search]
    assert_instance_of Array, data[:campsites]
    assert_instance_of Array, data[:reservations]
  end

  def test_reservation_system_can_create_hash_of_campsites
    file_path = './test-case.json'
    reservation_system = ReservationSystem.new(file_path)

    campsites = reservation_system.campsites

    assert_instance_of Hash, campsites

    campsite1 = campsites[1]

    assert_instance_of Campsite, campsite1
    assert_equal 1, campsite1.id
    assert_equal 'Cozy Cabin', campsite1.name
  end
end
