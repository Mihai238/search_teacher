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

    def edit

    end

    def update

    end

    def destroy

    end
end
