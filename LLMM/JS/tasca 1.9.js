factor = Number(prompt("Numero a factorizar"))
function factorial(){


resultat=1;
    for(let i = factor; i > 1; i--){
        resultat= resultat * i;
    }
    return resultat;
}