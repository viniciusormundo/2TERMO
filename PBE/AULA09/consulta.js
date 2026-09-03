const fs = require ('fs');
const entrada = require('readline-sync')

console.log ("=== SISTEMA DE CONSULTA DE ESTOQUE ===")

try {
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8')
    const produtos = JSON.parse (dadosTexto)

    const ternoBusca = entrada.question("Digite o nome do produto para buscar:");

    const resultado = produtos.find (p => p.nome.toLowerCase() === termoBusca.toLowerCase());

    if (resultado) {
        console.log("\n PRODUTO ENCONTRADO");
        console.log(` ID: ${resultado.id}`);
        console.log(`Nome: ${resultado.nome}`);
        console.log(`Quantidade em estoque: ${resultado.qtd}`);
    }else{
        console.log("\n Sinto muito. Produto não cadastrado no sitema")
    }
}catch(error){
    console.log("Erro ao acesar banco de dados" + error.message);


}