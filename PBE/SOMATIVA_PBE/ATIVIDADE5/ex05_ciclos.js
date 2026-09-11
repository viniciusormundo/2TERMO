const entrada = require('readline-sync');

const pecasCiclo = entrada.questionInt("Quantas pecas a maquina produz em um ciclo? ");
let producao = 0;

for (let ciclo = 1; ciclo <= 10; ciclo++) {
	producao += pecasCiclo;
	console.log(`Ciclo ${ciclo}: ${producao} pecas produzidas`);
}