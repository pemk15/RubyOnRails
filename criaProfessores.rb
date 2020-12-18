require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
     :database => "Trab.sqlite3"

ActiveRecord::Base.connection.create_table :professors do |t|
  t.string :nome,  limit: 50
  t.string :email, limit: 50
  t.string :salario,  limit: 14
end

