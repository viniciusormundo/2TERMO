const entrada = require("readline-sync");

const temperatura = entrada.questionFloat("Informe a temperatura em °C: ");

console.log(`temperatura: ${temperatura}`)
if (temperatura <=60){
    console.log('Situação normal' )
}else if (temperatura > 61 && temperatura <= 80){
    console.log('situação atenção')
} else { (temperatura > 80)
    console.log('situção critica');
}
