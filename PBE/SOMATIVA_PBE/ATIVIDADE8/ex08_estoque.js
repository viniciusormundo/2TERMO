const entrada = require('readline-sync');

const componentes = [];
const estoqueMini = 21;
const estoqueMax = 69;

for (let i = 0; i < 3; i++) {
	componentes.push({
		nome: entrada.question(`Nome do componente ${i + 1}: `),
		quantidade: entrada.questionInt("Quantidade: ")
	});
}