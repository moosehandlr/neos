require 'minitest/autorun'
require 'pry'
require 'figaro'
require 'faraday'
require_relative 'neo.rb'

Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NeoTest < Minitest::Test
  def setup
   @neo = Neo.new("1993-05-16")
  end

  def test_it_exist
   assert_instance_of Neo, @neo
  end

  def test_it_has_largest_astroid_diameter
   assert_equal @neo.largest_astroid_diameter, 10233
  end

  def test_it_has_total_number_of_asteroids
   assert_equal @neo.total_number_of_astroids, 5
  end

  def test_it_has_formatted_asteroid_data
   expected = {:name=>"(2000 OK8)", :diameter=>"1778 ft", :miss_distance=>"39880235 miles"}
   assert_equal expected,  @neo.formatted_asteroid_data.first
  end
end
