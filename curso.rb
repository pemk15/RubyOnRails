# -*- coding: utf-8 -*-
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Curso < ActiveRecord::Base
  has_many :turmas
  has_many :professors, through: :turmas
  has_onte :professor, through: :coordenators
end
