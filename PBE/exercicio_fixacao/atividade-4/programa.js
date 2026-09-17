function calcularTotal(preco, qtd) {
    return preco * qtd;
}
function Cupom (nome, valor) {
    return (`Cliente: ${nome} - Total a pagar: ${valor.toFixed(2)}`);
}

module.exports = { calcularTotal, Cupom };