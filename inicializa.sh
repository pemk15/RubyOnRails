rm Trab.sqlite3;
ruby criaDB.rb;
ruby Sistema.rb < valores.txt;
echo "select * from Professors"
sqlite3 Trab.sqlite3 'select * from Professors';
echo "select * from Alunos"
sqlite3 Trab.sqlite3 'select * from Alunos';