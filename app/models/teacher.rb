class Teacher < ActiveRecord::Base
  attr_accessible :adresse, :fach, :nachname, :preis, :schultyp, :vorname, :tel
  
  validates :adresse, :fach, :nachname, :vorname, :tel, :presence => true
end
