class Curso < ApplicationRecord
  has_many :turmas
  has_many :professores, through: :turmas
end
