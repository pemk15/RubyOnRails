ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Turma < ActiveRecord::Base
  belongs_to :professors
  belongs_to :cursos
  has_many :matriculas
end
