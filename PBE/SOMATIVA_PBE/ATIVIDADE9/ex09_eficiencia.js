const entrada = require('readline-sync');

function calcularEficiencia (real, prevista) {
	return (real / prevista) * 100;
}

function classificarEficiencia (percentual) {
    if (percentual >= 90) {
        console.log("META ATINGIDA");
    } else if (percentual >= 70 && percentual <= 89.99) {
        console.log("ATENÇÃO");
    } else {
        console.log("ABAIXO DA META");
    }
}
const prevista = entrada.questionFloat('Informe a producao prevista: ');
const real = entrada.questionFloat('Informe a producao real: ');
const percentual = calcularEficiencia(real, prevista);
const classificacao = classificarEficiencia(percentual);

console.log(`Producao prevista: ${prevista}`);
console.log(`Producao real: ${real}`);
console.log(`Eficiencia: ${percentual.toFixed(2)}%`);

