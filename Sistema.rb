# -*- coding: utf-8 -*-
$:.push './'
require 'professor.rb'
require 'aluno.rb'
require 'coordenator.rb'
require 'curso.rb'
require 'matricula.rb'
require 'turma.rb'

count = 0;
stop_condition = "\n";

until stop_condition == line = gets
  words = line.split;

  #Valida operação
  case
    when words[0] =~ /^insert$|^inserir$|^insere$/i
      op = 0;
    when words[0] =~ /^remove$|^delete$|^remover$/i
      op = 1;
    when words[0] =~ /^update$|^atualizar$/i
      op = 2;
    else
      STDERR.puts "#{words[0]} não é uma operação válida";
      error = 1;
  end
  words.shift 

  #Salva nome da tabela
  fields = {:tabela=>words[0].downcase};
  words.shift;

  columns = words.select {|e| e =~ /^id$|^nome$|^email$|^salario$|^fone$|^data_nascimento$|^professors_id$|^cursos_id$|^data_eleicao$|^departamento$|^turmas_id$|^alunos_id$|^data_matricula$|^data_inicio$|^carga_horaria$/i};

  for i in 0..(columns.length()-1)
    if i < (columns.length()-1) then
      fields[:"#{columns[i].downcase}"] = words[(words.index(columns[i])+1)..(words.index(columns[i+1])-1)].join(" ");
    else
      fields[:"#{columns[i].downcase}"] = words[(words.index(columns[i])+1)..-1].join(" ");
    end
  end

  error = false;
  if op == 0 then #Insert
    case
      when fields[:tabela] =~ /professor/
        classe = Professor.new();
        begin
          classe.nome = fields[:nome].split.map(&:capitalize).join(' ');
          classe.email = fields[:email] if fields.key?(:email);
          classe.salario = fields[:salario] if fields.key?(:salario);
        rescue
          STDERR.puts "Nome é obrigatório ao inserir um Professor";
          error = true
        end
      when fields[:tabela] =~ /aluno/
        classe = Aluno.new();
        begin
          classe.nome = fields[:nome].split.map(&:capitalize).join(' ');

          classe.email = fields[:email] if fields.key?(:email);
          classe.fone = fields[:fone] if fields.key?(:fone);
          classe.data_nascimento = fields[:data_nascimento] if fields.key?(:data_nascimento);
        rescue
          STDERR.puts "Nome é obrigatório ao inserir um Aluno";
          error = true
        end
      when fields[:tabela] =~ /coordenator/
        classe = Coordenator.new();
        begin
          classe.professors_id = fields[:professors_id];
          classe.cursos_id = fields[:cursos_id];
          classe.data_eleicao = fields[:data_eleicao];
        rescue
          STDERR.puts "professors_id, cursos_id e data_eleicao são obrigatórios ao inserir um Coordenator";
          error = true
        end
      when fields[:tabela] =~ /curso/
        classe = Curso.new();
        begin
          classe.nome = fields[:nome].split.map(&:capitalize).join(' ');
          classe.departamento = fields[:departamento];
        rescue
          STDERR.puts "nome e departamento são obrigatórios ao inserir um Curso";
          error = true
        end
      when fields[:tabela] =~ /matricula/
        begin
          classe = Matricula.new();
          classe.turmas_id = fields[:turmas_id];
          classe.alunos_id = fields[:alunos_id];
          classe.data_matricula = fields[:data_matricula];
        rescue
          STDERR.puts "professors_id, cursos_id e data_eleicao são obrigatórios ao inserir um Coordenator";
          error = true
        end
      when fields[:tabela] =~ /turma/
        classe = Turma.new();
        begin
          classe.professors_id = fields[:professors_id];
          classe.cursos_id = fields[:cursos_id];
          classe.data_inicio = fields[:data_inicio];
          classe.carga_horaria = fields[:carga_horaria] if fields.key?(:carga_horaria);
        rescue
          STDERR.puts "professors_id, cursos_id e data_inicio são obrigatórios ao inserir um Coordenator";
          error = true
        end
      else
        STDERR.puts "#{words[0]} não é uma tabela ou relação válida"
        error = true
    end
    if not error then
      classe.save
    end
  elsif op == 1 #delete
    key = fields.keys[1]
    value = fields.values[1];
    sentenca = "#{key}= #{value}"
    fields.drop(2).each do |key, value|
      sentenca += ", #{key}= #{value} ";
    end
    (fields[:tabela].capitalize).constantize.where(sentenca).destroy_all;
  elsif op == 2 #update
    sentenca = "id = " + fields[:id]
    classe = (fields[:tabela].capitalize).constantize.where(sentenca);
    fields.drop(2).each do |key, value|
      classe.update({:"#{key.downcase}"=>"#{value.split.map(&:capitalize).join(' ')}"});
    end
  end
end