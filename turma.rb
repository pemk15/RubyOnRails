ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Turma < ActiveRecord::Base
  belongs_to :professores
  belongs_to :cursos
  has_many :matriculas
end
