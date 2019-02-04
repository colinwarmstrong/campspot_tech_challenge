require 'json'
require 'pry'

class ReservationSystem
  attr_reader :data

  def initialize(json_file_path)
    @data = parse_json(json_file_path)
  end

  def parse_json(json_file_path)
    JSON.parse(read_file(json_file_path), symbolize_names: true)
  end

  private

  def read_file(file_path)
    File.read(file_path)
  end
end
