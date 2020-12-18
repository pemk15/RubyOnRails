require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
     :database => "Trab.sqlite3"

ActiveRecord::Base.connection.create_table :turmas do |t|
  t.column :professores_id, :integer
  t.column :cursos_id,      :integer
  t.column :data_inicio,    :date
  t.column :carga_horaria,  :smallint
end

ActiveRecord::Base.connection.add_foreign_key :turmas, :professores, column: :professores_id, on_delete: :cascade
ActiveRecord::Base.connection.add_foreign_key :turmas, :cursos,      column: :cursos_id,      on_delete: :cascade
