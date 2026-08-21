const entrada = require("readline-sync");
const logistica = require('./calcularFrete');

console.log(" === SISTEMAS EXPRESSO INDUSTRIAL");

const produto = entrada.question("produto a ser transportado: ");
const km = entrada.questionInt("distancia (km)");
const valorCarga = entrada.questionFloat("valor da carga: R$");

const freteBase = logistica.calcularBase(km);
const seguro = logistica.calcularSeguro(valorCarga);
const prazo  = logistica.verificadorPrazo(km);
const totalGeral = freteBase + seguro

console.log(`\n --- RELATORIO DE PSOTAGEM ---`)
console.log(`produto; ${produto}`);
console.log(`prazo de entraga ${prazo}`);
console.log(`frete base: R$ ${freteBase.toFixed(2)}`);
console.log(`seguro R$ ${seguro.toFixed(2)}`);
console.log(`total R$ ${totalGeral.toFixed(2)}`);
console.log("-".repeat(25));
