# RubyOnRails  
  
Trabalho disponível em: /home/bcc/pemk15/ProgWEB/RubyOnRails  
                        https://github.com/pemk15/RubyOnRails/  
  
**Relação 1:1**  
  1 curso só pode ter 1 coordenador  
  1 coordenador só pode coordenar 1 curso  
**Relação 1:n**  
  1 departamento pode conter varios cursos  
  1 curso pertence a somente 1 departamento  
**Relação n:m**  
  1 aluno possui muitas turmas  
  1 turma possui muitos alunos  
  
#criar DB caso o mesmo não exista  
ruby criaDB.rb;  
  
#popular o DB  
ruby Sistema.rb < valores.txt;  
