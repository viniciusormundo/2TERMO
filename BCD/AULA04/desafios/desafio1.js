const entrada = require('readline-sync');


const nome = entrada.question('diga seu nome: ');
const idade = entrada.questionInt('diga sua idade: ');

if (idade >= 16) {
    console.log(`\nParabens ${nome}, voce pode votar!`);
}else {
    console.log(`\n ${nome}, Infelizmente voce nao pode votar!`);
}





