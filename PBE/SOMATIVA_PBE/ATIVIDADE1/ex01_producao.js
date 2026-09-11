const entrada = require('readline-sync');

function CalcularTurno (n1, n2){
    return (n1 * n2) 
}
const resultado = entrada.questionFloat("Digite a quantidade de peças produzidas por hora: ")
const resultado2 = entrada.questionFloat("Digite a quantidade de horas do turno: ")
const final = CalcularTurno(resultado, resultado2)
console.log(`quantidade de peças produzidas no turno: ${final}`);