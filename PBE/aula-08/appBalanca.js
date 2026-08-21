const entrada = require("readline-sync");
const { verificarPeso } = require("./funcoesBalanca");

while (true) {

    const entrar = entrada.question(
        "\nDeseja entrar na balanca digital? (S/N): "
    );

    if (entrar.toLowerCase() === "n") {
        console.log("\nSistema da balanca encerrado.");
        break;
    }

    if (entrar.toLowerCase() !== "s") {
        console.log("⚠️ Digite apenas S ou N.");
        continue;
    }

    console.log("\n=== BALANCA DIGITAL ===");

    while (true) {

        try {
            const leitura = entrada.question(
                "\nDigite o peso da peca em gramas: "
            );

            const resultado = verificarPeso(leitura);

            console.log(`\n✅ ${resultado}`);

        } catch (erro) {
            console.log(`\n⚠️ ALERTA: ${erro.message}`);
        }

        // Pergunta C ou S até o usuário digitar uma opção válida
        while (true) {

            const opcao = entrada.question(
                "\nDeseja continuar ou sair? (C/S): "
            );

            if (opcao.toLowerCase() === "c") {
                break;
            }

            if (opcao.toLowerCase() === "s") {
                console.log("\nSistema da balanca encerrado.");
                process.exit(0);
            }

            console.log("⚠️ Digite apenas C ou S.");
        }
    }
}