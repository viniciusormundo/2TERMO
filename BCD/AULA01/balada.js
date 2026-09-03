const entrada = require('readline-sync');
const idade = entrada.questionInt("Qual sua idade");

if (idade>= 18) {
    console.log("Acesso Liberado! divirta-se");
} else {
    console.log(" acesso negado. vá para casa estudar node js mlk")
}
