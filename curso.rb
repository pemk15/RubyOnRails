ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Curso < ActiveRecord::Base
  has_many :turmas
  has_many :professors, through: :turmas
end
