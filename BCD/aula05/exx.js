const entrada = require('readline-sync');

function calcularMedia (n1, n2){
    return (n1 + n2) / 2
}

const resultado = entrada.questionFloat("Digite o primeiro numero: ")
const resultado2 = entrada.questionFloat("Digite o segundo numero: ")
const media = calcularMedia(resultado, resultado2);
console.log(`media calculada foi: ${media}`);

