const entrada = require('readline-sync');

const renda = entrada.questionFloat('qual a sua renda mensal? ');
const serasa = entrada.question('voce esta com o nome limpo no serasa? (s/n): ') === 's';

if (renda >= 2500 && serasa === true) {
    console.log('voce foi aprovado para o emprestimo!');
}else{
    console.log('voce nao foi aprovado para o emprestimo!');
}