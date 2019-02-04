require 'json'
require 'date'
require_relative 'campsite.rb'

class ReservationSystem
  attr_reader :data, :campsites

  def initialize(json_file_path)
    @data      = parse_json(json_file_path)
    @campsites = create_campsites
    seed_reservations
  end

  def determine_available_campsites
    pull_out_names_of_available_campsites(available_campsites)
  end

  private

  def parse_json(json_file_path)
    JSON.parse(read_file(json_file_path), symbolize_names: true)
  end

  def read_file(file_path)
    File.read(file_path)
  end

  def create_campsites
    data[:campsites].inject({}) do |campsites, campsite_info|
      campsite_id = campsite_info[:id]
      campsites[campsite_id] = Campsite.new(campsite_info)
      campsites
    end
  end

  def seed_reservations
    data[:reservations].each do |reservation_info|
      campsite_id = reservation_info[:campsiteId]
      campsites[campsite_id].add_reservation(reservation_info)
    end
  end

  def available_campsites
    campsites.find_all do |_, campsite|
      campsite.available?(desired_start_date, desired_end_date)
    end
  end

  def pull_out_names_of_available_campsites(available_campsites)
    available_campsites.map do |campsite_info|
      campsite_info.last.name
    end
  end

  def desired_start_date
    Date.parse(data[:search][:startDate])
  end

  def desired_end_date
    Date.parse(data[:search][:endDate])
  end
end
