const entrada = require('readline-sync');

const notas = []

const quantidade = entrada.questionInt('Quantas notas você deseja inserir? ');

for (let i = 0; i < quantidade; i++) {
    let nota = entrada.questionFloat(`Digite a nota ${i + 1}: `);
    notas.push(nota);
}
console.log("\nNotas cadastradas:");
console.log(notas);

console.log(`Quantidade de notas: ${notas.length}`);