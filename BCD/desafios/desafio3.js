const entrada = require('readline-sync');

const precoAlcool = entrada.questionFloat('qual o preco do alcool? :');
const precoGasolina = entrada.questionFloat('qual o preco da gasolina? :');
valor = precoAlcool / precoGasolina;

if (valor < 0.7) {
    console.log(`\n ${valor}abasteça com alcool!`);
}else {
    console.log(`\n ${valor}abasteça com gasolina!`);    
}

