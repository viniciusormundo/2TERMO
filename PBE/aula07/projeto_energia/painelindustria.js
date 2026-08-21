const entrada = require("readline-sync");

const painel = require("./calculoEnergia");

const nomeMaquina = readline.question("Digite o nome da maquina: ");

const potencia = readline.questionInt("Digite a potencia da maquina em Watts: ");
const horas = readline.questionInt("Digite as horas de uso no mes: ");
const precoKwh = readline.questionFloat("Digite o preco do kWh em reais: R$ ");
const totalKwh = calcularKwh(potencia, horas);
const custo = calcularCusto(totalKwh, precoKwh);
const classificacao = classificarConsumo(totalKwh);


console.log(`
========================================
       RELATORIO DE EFICIENCIA
========================================

Maquina: ${nomeMaquina.toUpperCase()}
Potencia: ${potencia} W
Horas de uso no mes: ${horas} horas

Consumo total: ${totalKwh.toFixed(2)} kWh
Preco do kWh: R$ ${precoKwh.toFixed(2)}
Custo mensal: R$ ${custo.toFixed(2)}

Classificacao: ${classificacao}

========================================`);