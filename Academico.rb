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

  case
    when words[0] =~ /professor/i
      puts("professor")
    when words[0] =~ /aluno/i
      puts("aluno")
    when words[0] =~ /coordenator/i
      puts("coordenator")
    when words[0] =~ /curso/i
      puts("curso")
    when words[0] =~ /matricula/i
      puts("matricula")
    when words[0] =~ /turma/i
      puts("turma")
    else
      STDERR.puts "#{words[0]} não é uma tabela ou relação válida"
      error = 1
  end
  words.delete(words[0])


  # words.each do |word|
  #   count += 1
  # end
end

puts(count)

=begin
inp = gets
novo = ''

str = ''
inp.each_char do |n|
  c = n
  str = str + n
  if n == ',' or n == '\n' then
    puts str
  end
end
puts str
=end

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



=begin
findOperation() {
  
}

# Método 2
est = Professor.new ({:nome => "Lucca Pietro Benício Fogaça", :email => "luccapietrobeniciofogaca@policiacivil.sp.gov.br", :salario => "1921.45"})
est.save

# Método 2
est = Aluno.new ({:cpf => "538.132.869-91",:nome => "Pedro Daniel Pinto", :email => "pedrodanielpinto_@pss.adv.br", :fone => "41 99536-0600", :data_nascimento => "19960820"})
est.save
=end
