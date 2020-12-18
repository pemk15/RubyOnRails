ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Matricula < ActiveRecord::Base
  belongs_to :turmas
  belongs_to :alunos
end

