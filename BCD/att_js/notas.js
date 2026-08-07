const entrada = require('readline-syc');

const nome = entrada
const n1 = entrada.questionFloat("Nota 1: ");
const n2 = entrada.questionFloat("nota 2: ");

const media = (n1 + n2) /2;

console.log('\nMedia final de ${nome}: ${media.toFixed(1)}');

if (media >= 7) {
    console.log("Situação: Aprovado");
} else if (media >=5 && media < 7){
    console.log()