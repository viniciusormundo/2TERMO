const entrada = require('readline-sync')
const checar = require('./programa');

const nome = entrada.question('Digite o nome do cliente: ');
const preco = entrada.questionFloat('Digite o preço do produto: ');
const qtd = entrada.questionInt('Digite a quantidade do produto: ');

const total = checar.calcularTotal(preco, qtd);
const cupom = checar.Cupom(nome, total);

console.log("\n--- CUPOM FISCAL ---");
console.log(cupom);