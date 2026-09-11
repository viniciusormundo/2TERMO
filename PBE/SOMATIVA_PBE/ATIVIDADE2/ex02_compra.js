const entrada = require("readline-sync");

function CalcularTurno (quantidade, preco){
    return (quantidade * preco)
}
const nomeMaterial = entrada.question("Informe o nome do material: ");
const quantidade = entrada.questionInt("Informe a quantidade do material: ");
const preco = entrada.questionFloat("Informe o preço do material: ");

const total = CalcularTurno(quantidade, preco);
console.log(`Total da compra: ${total.toFixed(2)} R$`);