require_relative 'test_helper.rb'
require_relative '../lib/campsite.rb'

class CampsiteTest < Minitest::Test
  def test_campsite_exists_and_has_correct_attributes
    campsite_info = { id: 1, name: 'Cozy Cabin' }
    campsite = Campsite.new(campsite_info)

    assert_instance_of Campsite, campsite
    assert_equal campsite_info[:id], campsite.id
    assert_equal campsite_info[:name], campsite.name
  end
end
