function calcularOrcamento(precoPeca, horas_Trabalho) {
    const valorHora = 85.00;
    const totalMaodeObra = horas_Trabalho * valorHora;
    return precoPeca + totalMaodeObra;
}

function verificarGarantia(meses){
    if (meses <= 3) {
        return "dentro da garantia";
    }else{
        return "garantia Expirada";
        }
}


function ComDesconto (valor){
return valor * 0.95;
}
 
module.exports = {
    calcularOrcamento,
    verificarGarantia,
    ComDesconto
}
