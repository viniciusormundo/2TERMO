const entrada = require('readline-sync');
const nomes = []


const quantidade = entrada.questionInt('Quantas notas você deseja inserir? ');

for (let i = 0; i < quantidade; i++) {
    let nome = entrada.question(`Digite o nome ${i + 1}: `);
    nomes.push(nome);
}


console.log("\nNomes cadastrados:");
console.log(nomes);
