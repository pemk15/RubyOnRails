require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
     :database => "Trab.sqlite3"

ActiveRecord::Base.connection.create_table :cursos do |t|
  t.string :nome,  limit: 50
  t.string :departamento, limit: 50
end

