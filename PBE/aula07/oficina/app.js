
const entrada = require('readline-sync')

//importa o modulo funcoesOficina
const oficina = require('./funcoesoficina')

console.log("=== SISTEMA DE GESTAO DE OFICINA ===")

const peca = entrada.questionFloat("Preco da peca: R$ ")
const horas = entrada.questionInt("Hora de servico: R$ ")
const tempoUso = entrada.questionFloat("Meses desde o ultimo conserto: ");
const statusGarantia = oficina.verificarGarantia(tempoUso);
const total = oficina.calcularOrcamento(peca, horas);
const totalComDesconto = oficina.ComDesconto(total);


//relatorio final
console.log("\n --- RELATORIO DE SERVIÇO ---")
console.log(`orcamento: R$ ${total.toFixed(2)}`);
console.log(`orcamneto com desconto (5%): R$ ${totalComDesconto.toFixed(2)}`)
console.log(`status de garantia ${statusGarantia}`);
console.log("");
