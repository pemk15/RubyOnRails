CREATE TABLE alunos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cpf char(11),
  nome varchar(50),
  email varchar(50),
  fone char(14),
  data_nascimento date
);

CREATE TABLE professores(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome varchar(50),
  email varchar(50),
  salario char(14)
);

CREATE TABLE cursos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome varchar(50),
  departamento varchar(50)
);

CREATE TABLE turmas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  professores_id INTEGER  REFERENCES professores(id) ON UPDATE CASCADE,
  cursos_id INTEGER REFERENCES cursos(id) ON UPDATE CASCADE,
  data_inicio DATE,
  carga_horaria SMALLINT(50)
);

CREATE TABLE matriculas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  turmas_id INTEGER  REFERENCES turmas(id) ON UPDATE CASCADE,
  alunos_id INTEGER REFERENCES alunos(id) ON UPDATE CASCADE,
  data_matricula DATE
);