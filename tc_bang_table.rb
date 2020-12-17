require "test/unit"
require_relative "bang_table"
require 'pry'
class TcBangTable < Test::Unit::TestCase

  def test_with_nil_url
  	url = nil
    result = BangTable.new.fetch_all_images url
    assert_equal("Invalid url!", result)
  end

  def test_with_first_invalid_url
  	url = 'httppjsassj'
    result = BangTable.new.fetch_all_images url
    assert_equal("Invalid url!", result)
  end

  def test_with_2nd_invalid_url
  	url = "http"
  	result = BangTable.new.fetch_all_images url
  	assert_equal("Invalid url!", result)
  end

  def test_with_valid_url_no_image
  	url = "https://www.google.com/"
  	result = BangTable.new.fetch_all_images url
  	assert_equal("No Image Available!", result)
  end

  def test_with_valid_image
  	url = "https://www.w3schools.com/css/css_image_gallery.asp"
  	result = BangTable.new.fetch_all_images url
  	assert_equal("All image collected", result)
  end

end