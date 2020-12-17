require 'open-uri'
require 'nokogiri'
require 'active_support'
require 'active_support/core_ext'

class BangTable

  def fetch_all_images url
	  #validate url
	  check_url = valid_url?(url)
	  if check_url
	  	begin
	  	image_html_document = Nokogiri::HTML.parse(open(url))
	  	# Looping through all the dom of class img and getting all the href
	  	image_content = image_html_document.xpath('//div[@class="img"]/a/@href')
	  	if image_content.present?
		  	image_content.each do |image|
		  		puts image.value
		  		# Print actual Image Link
					# base_url = 'https://www.w3schools.com/css/' 
					# actual_image_link = base_url + image.value
					# puts actual_image_link
		  	end
		  	'All image collected'
		  else
		  	"No Image Available!"
		  end
	  	rescue SocketError => e
	  		e.message 
	  	end
	  else
	  	'Invalid url!'
	  end
  end

  def valid_url?(url)
  	uri = URI.parse(url)
  	uri.is_a?(URI::HTTP) && !uri.host.nil?
		rescue URI::InvalidURIError
	  false
	end
end
# BangTable.new.fetch_all_images