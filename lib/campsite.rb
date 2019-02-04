require 'date'
require_relative 'reservation.rb'

class Campsite
  attr_reader :id, :name, :reservations

  def initialize(campsite_info)
    @id           = campsite_info[:id]
    @name         = campsite_info[:name]
    @reservations = []
  end

  def add_reservation(reservation_info)
    reservations.push(new_reservation(reservation_info))
  end

  def available?(start_date, end_date)
    reservations.none? do |reservation|
      create_one_day_gap?(start_date, end_date, reservation) ||
      overlapping_dates?(start_date, end_date, reservation)
    end
  end

  private

  def create_one_day_gap?(start_date, end_date, reservation)
    end_date + 2 == reservation.start_date || start_date - 2 == reservation.end_date
  end

  def overlapping_dates?(start_date, end_date, reservation)
    (start_date..end_date).any? do |desired_date|
      desired_date.between?(reservation.start_date, reservation.end_date)
    end
  end

  def new_reservation(reservation_info)
    Reservation.new(reservation_info)
  end
end
