const entrada = require('readline-sync');

let sistemaAtivo = true;

// Pergunta inicial
console.log("\n=== PAINEL DE CONTROLE INDUSTRIAL ===");
console.log("1 - Iniciar programa");
console.log("2 - Sair");

const inicio = entrada.question("\nDeseja iniciar o programa? ");

if (inicio === "2" || inicio.toLowerCase() === "sair") {
    sistemaAtivo = false;
    console.log("\nSistema encerrado.");
}

// Loop principal
while (sistemaAtivo) {

    try {

        console.log("\n===  PAINEL DE CONTROLE INDUSTRIAL ===");

        // Entrada da carga
        const leituraCarga = entrada.question(
            "Digite o valor da carga (kg): "
        );

        // Permite sair durante a entrada
        if (leituraCarga.toLowerCase() === "sair") {
            sistemaAtivo = false;
            console.log("\nEncerrando sistema...");
            break;
        }

        // Entrada da quantidade de máquinas
        const leituraMaquinas = entrada.question(
            "Dividir por quantas maquinas? "
        );

        // Conversão para números
        const num1 = Number(leituraCarga);
        const num2 = Number(leituraMaquinas);

        // 1. Verificar se são números
        if (isNaN(num1) || isNaN(num2)) {
            throw new Error(
                "Voce digitou letras ou um valor invalido. Digite apenas numeros!"
            );
        }

        // 2. Verificar se a quantidade de máquinas é inteira
        if (!Number.isInteger(num2)) {
            throw new Error(
                "A quantidade de maquinas deve ser um numero INTEIRO."
            );
        }

        // 3. Impedir divisão por zero
        if (num2 === 0) {
            throw new Error(
                "Divisao por zero nao permitida."
            );
        }

        // 4. Realizar o cálculo
        const resultado = num1 / num2;

        // 5. Mostrar resultado
        console.log("\n-------------------------------------------");
        console.log(
            `✅ SUCESSO: Cada maquina recebera ${resultado.toFixed(2)} kg`
        );
        console.log("-------------------------------------------");

        // Perguntar se deseja continuar
        console.log("\nO que deseja fazer agora?");
        console.log("1 - Fazer outro calculo");
        console.log("2 - Sair do programa");

        const continuar = entrada.question("\nEscolha uma opcao: ");

        if (continuar === "2" || continuar.toLowerCase() === "sair") {
            sistemaAtivo = false;
            console.log("\nEncerrando sistema...");
        }

    } catch (erro) {

        // Tratamento de erros
        console.log("\n-------------------------------------------");
        console.log(`⚠️ ALERTA DE SISTEMA: ${erro.message}`);
        console.log("-------------------------------------------");
        console.log("Tente novamente.\n");
    }
}

console.log("\nSistema desligado com segurança.");