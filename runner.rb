require './lib/reservation_system.rb'

reservation_system = ReservationSystem.new('test-case.json')

available_campsites = reservation_system.determine_available_campsites

puts 'LIST OF AVAILABLE CAMPSITES:'
puts '----------------------------'
puts available_campsites
