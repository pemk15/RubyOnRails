require 'rubygems' 
require 'active_record' 
 
ActiveRecord::Base.establish_connection :adapter => "sqlite3", 
     :database => "Trab.sqlite3" 
 
ActiveRecord::Base.connection.create_table :alunos do |t|  
  t.string :cpf,   limit: 11
  t.string :nome,  limit: 50
  t.string :email, limit: 50
  t.string :fone,  limit: 14
  t.date   :data_nascimento 
end 
