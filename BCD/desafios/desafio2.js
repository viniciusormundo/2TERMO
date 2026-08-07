const entrada = require('readline-sync');

const valor = entrada.questionFloat('qual o valor da sua compra? :');
if (valor >= 100){
    preço = valor - (valor * 0.10);
    console.log(`\nParabens, voce ganhou 10% de desconto! O valor da sua compra com desconto é: ${preço}`);
}else{
    console.log(`\nInfelizmente voce nao ganhou desconto! ${valor} é o valor da sua compra!`);
}