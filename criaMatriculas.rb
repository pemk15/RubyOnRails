require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
     :database => "Trab.sqlite3"

ActiveRecord::Base.connection.create_table :matriculas do |t|
  t.column :turmas_id,      :integer
  t.column :alunos_id,      :integer
  t.column :data_matricula, :date
end

ActiveRecord::Base.connection.add_foreign_key :matriculas, :turmas, column: :turmas_id, on_delete: :cascade
ActiveRecord::Base.connection.add_foreign_key :matriculas, :alunos, column: :alunos_id, on_delete: :cascade

