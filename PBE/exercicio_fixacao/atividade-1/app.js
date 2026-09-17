const entrada = require('readline-sync');   
const moeda = require('./conversor') 

const valor = entrada.questionFloat("Digite o valor em Dolar (US$): ");
const resultado = moeda.calcularDolar(valor);

console.log(`O valor convertido e: R$ ${resultado.toFixed(2)}`);