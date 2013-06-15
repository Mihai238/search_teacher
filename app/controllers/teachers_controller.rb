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
		
		@tea = destroy
    end
	
    def edit

    end

    def update

    end

    def destroy
		vorname = params[:vorname1]
        nachname = params[:nachname1]
		password = params[:password1]
		
		teachers = Teacher.all
		
		teachers.each do |t|
			if t.vorname == vorname && t.nachname == nachname && t.password == password
				Teacher.destroy(t.id)
			end
		end		
		
    end
end
