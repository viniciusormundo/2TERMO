// Calculadora de Área de Terrenos

const entrada = require("readline-sync");

function calcular_area(largura, comprimento){
    return largura * comprimento;
};

const largura = entrada.questionFloat("Informe a largura do terreno [m²]: ");
const comprimento = entrada.questionFloat("Informe o comprimento do terreno [m²]: ");

const area = calcular_area(largura, comprimento);

console.log(`Area total do terreno: ${area}m²`);