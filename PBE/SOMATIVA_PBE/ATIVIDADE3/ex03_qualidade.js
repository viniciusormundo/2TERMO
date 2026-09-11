const entrada = require("readline-sync"); 

const peso = entrada.questionFloat("Informe o peso da peça: ");

if (peso >= 95 && peso <= 105){
    console.log('PEÇA APROVADA ✅' )
} else {
    console.log('PEÇA REPROVADA ⚠️' )  
}
console.log(`peso da peça: ${peso}g`)