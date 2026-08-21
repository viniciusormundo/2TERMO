const entrada = require('readline-sync');

const idade = entrada.questionInt('bem vindo a escola de natacao, diga sua idade: ');

if (idade >= 5 && idade <= 10) {
    console.log('\n voce foi matriculado na turma infantil.');
}else if (idade >= 11 && idade <= 17) {
    console.log('Voce foi matriculado na turma juvenil.');
} else if (idade >= 18 && idade <= 60) {
    console.log('voce foi matriculado na turma adulto.');
}else {
    console.log('voce foi matriculado na turma Senior.');
}
