require 'json'
require 'pry'
require_relative 'campsite.rb'

class ReservationSystem
  attr_reader :data, :campsites

  def initialize(json_file_path)
    @data = parse_json(json_file_path)
    @campsites = create_campsites
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
      id = campsite_info[:id]
      campsites[id] = Campsite.new(campsite_info)
      campsites
    end
  end
end
