# -*- coding: utf-8 -*-
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Aluno < ActiveRecord::Base;
  has_many :matriculas
  has_many :turmas, through: :matriculas
end