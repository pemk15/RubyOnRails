require 'rubygems' 
require 'active_record' 
 
ActiveRecord::Base.establish_connection :adapter => "sqlite3", 
     :database => "Trab.sqlite3" 

#Cursos disponiveis
ActiveRecord::Base.connection.create_table :cursos do |t|
  t.string :nome,  limit: 50
  t.string :departamento, limit: 50
end;
#tabela que armazena os professores do curso 
ActiveRecord::Base.connection.create_table :professors do |t|
  t.string :nome,  limit: 50
  t.string :email, limit: 50
  t.string :salario,  limit: 14
end;

#Tabela que armazena os alunos do curso
ActiveRecord::Base.connection.create_table :alunos do |t|  
  t.string :nome,  limit: 50
  t.string :email, limit: 50
  t.string :fone,  limit: 14
  t.date   :data_nascimento 
end;

#Turmas disponíveis para o curso
ActiveRecord::Base.connection.create_table :turmas do |t|
  t.column :professors_id, :integer
  t.column :cursos_id,      :integer
  t.column :data_inicio,    :date
  t.column :carga_horaria,  :smallint
end

ActiveRecord::Base.connection.add_foreign_key :turmas, :professors, column: :professors_id, on_delete: :cascade
ActiveRecord::Base.connection.add_foreign_key :turmas, :cursos,      column: :cursos_id,      on_delete: :cascade

#Alunos matricucalos nas turmas
ActiveRecord::Base.connection.create_table :matriculas do |t|
  t.column :turmas_id,      :integer
  t.column :alunos_id,      :integer
  t.column :data_matricula, :date
end

ActiveRecord::Base.connection.add_foreign_key :matriculas, :turmas, column: :turmas_id, on_delete: :cascade
ActiveRecord::Base.connection.add_foreign_key :matriculas, :alunos, column: :alunos_id, on_delete: :cascade

#Coordenadores de cursos
ActiveRecord::Base.connection.create_table :coordenators do |t|
  t.column :professors_id,  :integer
  t.column :cursos_id,      :integer
  t.column :data_eleicao, :date
end

ActiveRecord::Base.connection.add_foreign_key :coordenators, :professors, column: :professors_id, on_delete: :cascade
ActiveRecord::Base.connection.add_foreign_key :coordenators, :cursos,     column: :cursos_id,     on_delete: :cascade