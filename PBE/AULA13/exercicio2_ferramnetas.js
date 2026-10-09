const fs = require('fs');
const entrada = require('readline-sync');

const ferramentas = [];
const quantidadeFerramentas = entrada.questionInt("Quantas ferramentas deseja cadastrar? ");

for (let i = 0; i < quantidadeFerramentas; i++) {
  console.log(`\n--- Ferramenta ${i + 1} ---`);

  const nome = entrada.question("Nome: ");
  const quantidade = entrada.questionInt("Quantidade: ");
  const custoUnitario = entrada.questionFloat("Custo unitario: R$ ");

  ferramentas.push({
    nome: nome,
    quantidade: quantidade,
    custoUnitario: custoUnitario
  });
}

fs.writeFileSync(
  "ferramentas.json",
  JSON.stringify(ferramentas, null, 2)
);

console.log(
  `\nCadastro realizado com sucesso! ${ferramentas.length} ferramenta(s) cadastrada(s).`
);