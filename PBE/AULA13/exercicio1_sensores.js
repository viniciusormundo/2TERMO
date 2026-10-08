const fs = require('fs');

const sensores = [
    {codigo: 1001, tipo: "Temperatura", leituraAtual: 55.6, status: "Operando"},
    {codigo: 1002, tipo: "Pressao", leituraAtual: 6, status: "Operando"},
    {codigo: 1001, tipo: "Temperatura", leituraAtual: 255.9, status: "Alerta!"}
];
fs.writeFileSync('sensores.json', JSON.stringify(sensores, null, 2));
console.log(`\nGravacao concluida com sucesso, verifique o arquivo gravado na pasta`);
