const fs = require('fs');
const entrada = require('readline-sync');

console.log("\n=== PRODUTOS COM MENOS DE 100 UNIDADES ===");

const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
const produtos = JSON.parse(dadosTexto);
const produtosComPoucoEstoque = produtos.filter(p => p.qtd < 100);

if (produtosComPoucoEstoque.length > 0) {

    produtosComPoucoEstoque.forEach(produto => {
        console.log(`\nID: ${produto.id}`);
        console.log(`Nome: ${produto.nome}`);
        console.log(`Quantidade em estoque: ${produto.qtd}`);
    });

} else {

    console.log("\nNenhum produto possui menos de 100 unidades.");

}