const entradas = require('readline-sync');

console.log('--- controle de acesso ---')
const login = entradas.questionInt('Digite sua idade: ');
const autorizacao = entradas.question('Você tem autorização? (s/n): ') === 's';
const professor = entradas.question('Você é professor? (s/n): ') === 's';
const suepenso = entradas.question('Você está suspenso? (s/n): ') === 'n';


if ((autorizacao && login >= 16) || professor) {
    console.log("Acesso permitido.");
} else {
    console.log("Acesso negado.");
}

