class StudentsController < ApplicationController

    def index

    end

    def create
        # call the search method
        # in order to obtain the teachers

        @sortedArrayByDist = search_teachers
		#redirect_to students_path, :notice => "Lehrer gefunden"
        render :index
    end

	def search_teachers
		adresseStudent = params[:adresse]
		fach = params[:fach]
        
        Rails.logger.debug("Caut profi la materia: #{fach}")

        teachers = Teacher.all
        foundTeachers = []
        teachers.each do |t|
            if t.fach.include? fach
                Rails.logger.debug("Am gasit un proful: #{t.vorname}")
                adresseProf = t.adresse        

                # Compute the distance
                t.dist = Integer(compute_distance(adresseStudent, adresseProf).fetch(0).value)
                Rails.logger.debug("Distance to the theacer: #{t.dist}")
                foundTeachers.push(t)
            end			
        end

        Rails.logger.debug("In total #{foundTeachers.length} Teachers found")
        @sortedArrayByDist = foundTeachers.sort[0, [foundTeachers.length, 5].min]

        @sortedArrayByDist.each do |t|
            t.compute_coords
            Rails.logger.debug("Teacher #{t.vorname} with coords #{t.lat} and #{t.lng}")
        end


        @sortedArrayByDist
	end

    # Compute the distance between 2 addresses
    def compute_distance(adr1, adr2)
        require 'net/http'
        require "rexml/document"

        uri = 'http://maps.googleapis.com/maps/api/distancematrix/xml?origins='+ adr1 +'&destinations='+ adr2 +'&sensor=false'
        uri = URI.parse(URI.encode(uri.strip))
        doc = REXML::Document.new(Net::HTTP.get(uri))

        #puts doc.to_s
        doc.elements.each('DistanceMatrixResponse/row/element/duration/value/text()') do |p|
            p.text
        end
    end

end