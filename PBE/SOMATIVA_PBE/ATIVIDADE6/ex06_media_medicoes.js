const entrada = require('readline-sync');
let soma = 0;

for (let i = 1; i <= 5; i++) {
	const valor = entrada.questionFloat(`Informe a medicao ${i}: `);
	soma += valor;
}

const media = soma / 5;
console.log(`Soma das medicoes: ${soma}`);
console.log(`Media final: ${media}`);