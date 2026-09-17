function checarTemp (ar){
     if (ar > 40) {
        return "ALERTA: Caldeira Superaquecida ⚠️";
     }
     return "Temperatura Normal ✅";
}

     function checarUmi (ar){
        if (ar < 20) {
        return "ALERTA: Ar muito seco ⚠️";
     }
     return "Umidade Normal ✅";
}
module.exports = {checarTemp, checarUmi};