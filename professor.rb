# -*- coding: utf-8 -*-
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Trab.sqlite3" 
                                        
class Professor < ActiveRecord::Base
  has_many :turmas
  belongs_to :cursos
end

