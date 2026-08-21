const entrada = require('readline-syc');

<<<<<<< HEAD
const nome = entrada.question("seu nome");
=======
const nome = entrada.question("Digite o nome do aluno: ");
>>>>>>> 1f43c09f3822e0fb8dc89bff0dc5bf12cdbab04d
const n1 = entrada.questionFloat("Nota 1: ");
const n2 = entrada.questionFloat("nota 2: ");

const media = (n1 + n2) /2;

console.log('\nMedia final de ${nome}: ${media.toFixed(1)}');

if (media >= 7) {
    console.log("Situação: Aprovado");
} else if (media >=5 && media < 7){
<<<<<<< HEAD
    console.log()("Situação: Recuperação");
    } else { 
        console.log(`voce um erro ${nome}`);
=======
    console.log("Situação: Recuperação");
} else {
    console.log("Situação: Reprovado");
>>>>>>> 1f43c09f3822e0fb8dc89bff0dc5bf12cdbab04d
}