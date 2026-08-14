const produto = {
    nome: "teclado",
    preco: 150.0,
    estoque: 25,
    oferta: true
};
console.log(`produto: ${produto.nome}`);
console.log(`Preco: R$ ${produto.preco.toFixed(2)}`);
console.log(`produto: ${produto.nome} | ${produto.preco} ${produto.estoque} | ${produto.oferta}`);

