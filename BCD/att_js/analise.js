const entrada = require('readline-sync');

console.log('--- Analise de erros ---')

//coleta de dados
const nome = entrada.question('nome do cliente: ');
const idade = entrada.questionInt('idade: ');
const renda = entrada.questionFloat('renda mensal: ');
const temImovel = entrada.question('tem imovel proprio? (s/n): ') === 's';

if (idade >= 18 && renda >= 2500 || temImovel ===  true) {
    console.log(`\nParabens ${nome}, voce foi aprovado para o emprestimo!`);
} else {
    console.log(`\nInfelizmente ${nome}, voce nao foi aprovado para o emprestimo!`);
}






