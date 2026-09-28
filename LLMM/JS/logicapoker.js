function init(){
    const baralla = inicialitzaCartes();
    console.log(baralla);
    const cartesMesclades= mesclar(baralla);

    pintarCartes(cartesMesclades);
    pintarBoto();

}
function mesclar(baralla){
    return baralla.sort((a,b)=>math.random() -0.5);
}

function pintarBoto(){
    const boto = document.createElement("button");
    boto.textContent="Jugar";
    boto.addEventListener('click', function(){})
}


function pintarCartes(cartes){
    for(let i=0; i<cartes.length;i++){

        const carta=document.createElement("IMG");

        carta.src ='./assets/'+parseImageName(cartes[i]);

        document.querySelector("#app").appendChild(carta);
    }
}

function parseImageName(carta){

    let nomCarta = '';
    if(carta.numero==='A'){
        nomCarta += 'ace';
    }else if (carta.numero==='J'){
        nomCarta += 'jack';
    }else if (carta.numero==='Q'){
        nomCarta += 'queen';
    }else if(carta.numero==='K'){
        nomCarta += 'king';
    }else {
        nomCarta += carta.numero;
    }

    nomCarta += '_of_';
    if(carta.pal==='Diamant'){
        nomCarta += 'diamonds';
    }else if(carta.pal==='Pica'){
        nomCarta += 'spades';
    }else if(carta.pal==='Trevol'){
        nomCarta += 'clubs';
    }else if(carta.pal==='Cor'){
        nomCarta += 'heards'
    } return nomCarta;
}

init();