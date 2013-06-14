require 'google/api_client'
require 'net/http'
require "rexml/document"

if ARGV.size != 2
    puts 'Insert 2 locations'
    exit
end

adr1 = ARGV[0]
adr2 = ARGV[1]

uri = URI('http://maps.googleapis.com/maps/api/distancematrix/xml?origins='+ adr1 +'&destinations='+ adr2 +'&sensor=false')
doc = REXML::Document.new(Net::HTTP.get(uri))

#puts doc.to_s
doc.elements.each('DistanceMatrixResponse/row/element/duration/value') do |p|
    puts p
end
