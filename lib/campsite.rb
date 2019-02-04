class Campsite
  attr_reader :id, :name

  def initialize(campsite_info)
    @id = campsite_info[:id]
    @name = campsite_info[:name]
  end
end
