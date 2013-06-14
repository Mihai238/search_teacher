class Teacher < ActiveRecord::Base
    include Comparable

    attr_accessible :adresse, :fach, :nachname, :preis, :schultyp, :vorname, :tel

    validates :adresse, :fach, :nachname, :vorname, :tel, :presence => true
    attr_accessor :dist, :lat, :lng

    def <=> (other)
       dist <=> other.dist 
    end

    def compute_coords
        temp_addr = adresse
        #while temp_addr.include? " "
            #temp_addr = temp_addr.sub(" ", "")
        #end

        Rails.logger.debug("Address of the current teacher: #{temp_addr}")
        uri = 'http://maps.googleapis.com/maps/api/geocode/xml?address='+ temp_addr +'+&sensor=true'
        uri = URI.parse(URI.encode(uri.strip))
        doc = REXML::Document.new(Net::HTTP.get(uri))

        doc.elements.each('GeocodeResponse/result/geometry/location/lat/') do |p|
            Rails.logger.debug("In Method compute_coords: #{p.text.to_f}")
            self.lat = p.text.to_f
        end

        doc.elements.each('GeocodeResponse/result/geometry/location/lng/') do |p|
            Rails.logger.debug("In Method compute_coords: #{p.text.to_f}")
            self.lng = p.text.to_f
        end
    end
end
