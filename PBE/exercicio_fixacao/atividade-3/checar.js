const entrada = require('readline-sync')
const checar = require('./sensor');

const t = entrada.questionFloat("Temperatura atual: ");
const u = entrada.questionFloat("Umidade atual: ");

console.log(sensor.checarTemp(t));
console.log(sensor.checarUmi(u));