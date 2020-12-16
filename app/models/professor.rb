class Professor < ApplicationRecord
  has_many :turmas
  belongs_to :cursos, through: :turmas
end

