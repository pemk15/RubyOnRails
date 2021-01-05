# -*- coding: utf-8 -*-
$:.push './'
require 'professor.rb'
require 'aluno.rb'
require 'coordenator.rb'
require 'curso.rb'
require 'matricula.rb'
require 'turma.rb'

count = 0
stop_condition = "\n"

until stop_condition == line = gets
  words = line.split
  #Valida operação
  case
    when words[0] =~ /insert|inserir|insere/i
      op = 0
    when words[0] =~ /remove|delete|remover/i
      op = 1
    when words[0] =~ /update|atualizar/i
      op = 2
    else
      STDERR.puts "#{words[0]} não é uma operação válida"
      error = 1

  end
  words.shift 
  fields = {:tabela=>words[0].downcase}
  case
    when words[0] =~ /professor/i
      words.shift;
      if op == 0 then
        columns = words.select {|e| e =~ /nome|email|salario/i};

        fields[:"#{columns[0].downcase}"] = words[(words.index(columns[0])+1)..(words.index(columns[1])-1)].join(" ") if (columns.length() > 0);
        fields[:"#{columns[1].downcase}"] = words[(words.index(columns[1])+1)..(words.index(columns[2])-1)].join(" ") if (columns.length() > 1);
        fields[:"#{columns[2].downcase}"] = words[(words.index(columns[2])+1)..-1].join(" ") if (columns.length() > 2);

        professor = Professor.new()
        professor.nome = fields[:nome].split.map(&:capitalize).join(' ')
        professor.email = fields[:email]
        professor.salario = fields[:salario]
        professor.save
      end
    when words[0] =~ /aluno/i
      words.shift;
      if op == 0 then
        columns = words.select {|e| e =~ /nome|email|fone|data_nascimento/i};
        fields[:"#{columns[0].downcase}"] = words[(words.index(columns[0])+1)..(words.index(columns[1])-1)].join(" ") if (columns.length() > 0);
        fields[:"#{columns[1].downcase}"] = words[(words.index(columns[1])+1)..(words.index(columns[2])-1)].join(" ") if (columns.length() > 1);
        fields[:"#{columns[2].downcase}"] = words[(words.index(columns[2])+1)..(words.index(columns[3])-1)].join(" ") if (columns.length() > 2);
        fields[:"#{columns[3].downcase}"] = words[(words.index(columns[3])+1)..-1].join(" ") if (columns.length() > 3);

        aluno = Aluno.new()
        aluno.nome = fields[:nome].split.map(&:capitalize).join(' ')
        aluno.email = fields[:email]
        aluno.fone = fields[:fone]
        aluno.data_nascimento = fields[:data_nascimento]
        aluno.save
      end
    when words[0] =~ /coordenator/i
      words.shift;
      if op == 0 then
        columns = words.select {|e| e =~  /professors_id|cursos_id|data_eleicao/i};

        fields[:"#{columns[0].downcase}"] = words[(words.index(columns[0])+1)..(words.index(columns[1])-1)].join(" ") if (columns.length() > 0);
        fields[:"#{columns[1].downcase}"] = words[(words.index(columns[1])+1)..(words.index(columns[2])-1)].join(" ") if (columns.length() > 1);
        fields[:"#{columns[2].downcase}"] = words[(words.index(columns[2])+1)..-1].join(" ") if (columns.length() > 2);

        coordenator = Coordenator.new()
        coordenator.professors_id = fields[:professors_id]
        coordenator.cursos_id = fields[:cursos_id]
        coordenator.data_eleicao = fields[:data_eleicao]
        coordenator.save
      end
    when words[0] =~ /curso/i
      words.shift;
      if op == 0 then
        columns = words.select {|e| e =~ /nome|departamento/i};

        fields[:"#{columns[0].downcase}"] = words[(words.index(columns[0])+1)..(words.index(columns[1])-1)].join(" ") if (columns.length() > 0);
        fields[:"#{columns[1].downcase}"] = words[(words.index(columns[1])+1)..-1].join(" ") if (columns.length() > 1);

          curso = Curso.new();
          curso.nome = fields[:nome].split.map(&:capitalize).join(' ');
          curso.departamento = fields[:departamento];
          curso.save;
      end
    when words[0] =~ /matricula/i
      words.shift;
      if op == 0 then
        columns = words.select {|e| e =~  /turmas_id|alunos_id|data_matricula/i};

        fields[:"#{columns[0].downcase}"] = words[(words.index(columns[0])+1)..(words.index(columns[1])-1)].join(" ") if (columns.length() > 0);
        fields[:"#{columns[1].downcase}"] = words[(words.index(columns[1])+1)..(words.index(columns[2])-1)].join(" ") if (columns.length() > 1);
        fields[:"#{columns[2].downcase}"] = words[(words.index(columns[2])+1)..-1].join(" ")  if (columns.length() > 2);

        matricula = Matricula.new()
        matricula.turmas_id = fields[:turmas_id]
        matricula.alunos_id = fields[:alunos_id]
        matricula.data_matricula = fields[:data_matricula]
        matricula.save
      end
    when words[0] =~ /turma/i
      words.shift;
      if op == 0 then
        columns = words.select {|e| e =~  /professors_id|cursos_id|data_inicio|carga_horaria/i};

        fields[:"#{columns[0].downcase}"] = words[(words.index(columns[0])+1)..(words.index(columns[1])-1)].join(" ") if (columns.length() > 0);
        fields[:"#{columns[1].downcase}"] = words[(words.index(columns[1])+1)..(words.index(columns[2])-1)].join(" ") if (columns.length() > 1);
        fields[:"#{columns[2].downcase}"] = words[(words.index(columns[2])+1)..(words.index(columns[3])-1)].join(" ") if (columns.length() > 2);
        fields[:"#{columns[3].downcase}"] = words[(words.index(columns[3])+1)..-1].join(" ")  if (columns.length() > 3);

        turma = Turma.new()
        turma.professors_id = fields[:professors_id]
        turma.cursos_id = fields[:cursos_id]
        turma.data_inicio = fields[:data_inicio]
        turma.carga_horaria = fields[:carga_horaria]
        turma.save
      end
    else
      STDERR.puts "#{words[0]} não é uma tabela ou relação válida"
      error = 1
  end
end

=begin
if startsWith (ins, rem, atu) then
  opperation = findOperation;
  removeOperacao; #Encontra a primeira ',' e remove tudo até ela
  if startsWith(videTableName) then
    table = findTable;
    removeTable;#Encontra a primeira ',' e remove tudo até ela
    while not '\n' do
      encontraNomeCampo;
      atribuiValorAoCampo;
    end
    if preencheuCamposObrigatorios then
      save;
    else
      raise naoPreencheuTudo;
  else
    raise errorNotAValidTable
  end
else
  raise errorNotAValidOperation;
end
=end