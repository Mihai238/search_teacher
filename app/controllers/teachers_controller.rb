class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all
		@teacher = Teacher.new
    end

    def show

    end

    def new
		
    end

    def create
		@teacher = Teacher.new(params[:teacher])
		
		if @teacher.save
			redirect_to teachers_path, :notice => "Profil erfolgreich gespeichert"
		else
			render "index", :notice => "Error"
		end
    end
	
	# def search
		# adresse = params[:adresse]
		# fach = params[:fach]
		# redirect_to students_path, :notice => "perfect"
	# end
    # helper_method :search
	
    def edit

    end

    def update

    end

    def destroy

    end
end
