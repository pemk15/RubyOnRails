class Matricula < ApplicationRecord
  belongs_to :turmas
  belongs_to :alunos
end

