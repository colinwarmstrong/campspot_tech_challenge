require_relative 'test_helper.rb'
require_relative '../lib/reservation_system.rb'

class ReservationSystemTest < Minitest::Test
  def test_reservation_system_exists
    file_path = './test-case.json'
    reservation_system = ReservationSystem.new(file_path)

    assert_instance_of ReservationSystem, reservation_system
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
end
