function Carta(num, pal){
    this.numero = num;
    this.pal = pal;
}

function inicialitzaCartes(){
    const nombres=["2","3","4","5","6","7","8","9","10","J","Q","K","A"];
    const pals=["Diamant","Pica","Trevol","Cor"];
    const baralla=[];
    for(let i=0; i<nombres.length; i++){
        for(let j=0;j<pals.length;j++){
            baralla.push(new Carta(nombres[i],pals[j]));
        }
    }
    return baralla;
}