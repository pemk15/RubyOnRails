class Turma < ApplicationRecord
  belongs_to :professores
  belongs_to :cursos
end
