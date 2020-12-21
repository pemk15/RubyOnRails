# -*- coding: utf-8 -*-
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Coordenator < ActiveRecord::Base
  belongs_to :professors
  belongs_to :cursos
end