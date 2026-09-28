const partsup = document.createElement("div")
partsup.classList.add("partsup")
const contenedor1 = document.querySelector("body");
//inserir label, input, button
const conteinner = document.createElement("div");
conteinner.classList.add("inner");
partsup.appendChild(conteinner);
conteinner.innerHTML = // creacion del contendido del conetener que inyecta en el html
    `<body>
    <div id="fila-superior">
    <div id="poke1">
        <input id="input_poke1">
        <table>
            <tr>
                <th>Estadistica</th>
                <th >Valor</th>
            </tr>
            <tr>
                <td>Vida</td>
                <td id="p1_vida"></td>
            </tr>
            <tr>
                <td>Atac</td>
                <td id="p1_atac"></td>
            </tr>
            <tr>
                <td>Atac Especial</td>
                <td id="p1_atac_e"></td>
            </tr>
            <tr>
                <td>Defensa</td>
                <td id="p1_def"></td>
            </tr>
            <tr>
                <td>Defensa Especial</td>
                <td id="p1_def_e"></td>
            </tr>
            <tr>
                <td>Velocitat</td>
                <td id="p1_vel"></td>
            </tr>
            <tr>
                <td>Altura</td>
                <td id="p1_altura"></td>
            </tr>
            <tr>
                <td>Pes</td>
                <td id="p1_pes"></td>
            </tr>
        </table>
    </div>
    <div id="poke2">
        <input id="input_poke2">
        <table>
            <tr>
                <th>Estadistica</th>
                <th >Valor</th>
            </tr>
            <tr>
                <td>Vida</td>
                <td id="p2_vida">   </td>
            </tr>
            <tr>
                <td>Atac</td>
                <td id="p2_atac"></td>
            </tr>
            <tr>
                <td>Atac Especial</td>
                <td id="p2_atac_e"></td>
            </tr>
            <tr>
                <td>Defensa</td>
                <td id="p2_def"></td>
            </tr>
            <tr>
                <td>Defensa Especial</td>
                <td id="p2_def_e"></td>
            </tr>
            <tr>
                <td>Velocitat</td>
                <td id="p2_vel"></td>
            </tr>
            <tr>
                <td>Altura</td>
                <td id="p2_altura"></td>
            </tr>
            <tr>
                <td>Pes</td>
                <td id="p2_pes"></td>
            </tr>
        </table>
    </div>
    </div>
    <div id="fila-inferior">
    <div id="comp">
        <button id="btn_comparar">Comparar</button>
        <table id="comparar_table">
            <tr>
                <th>Estadistica</th>
                <th id="nom_poke1"></th>
                <th>Guanyador</th>
                <th id="nom_poke2"></th>
            </tr>
            <tr>
                <td>Vida</td>
                <td id="vida_poke1"></td>
                <td id="win_vida"></td>
                <td id="vida_poke2"></td>
            </tr>
            <tr>
                <td>Atac</td>
                <td id="atac_poke1"></td>
                <td id="win_atac"></td>
                <td id="atac_poke2"></td>
            </tr>
            <tr>
                <td>Atac Especial</td>
                <td id="at_e_poke1"></td>
                <td id="win_at_e"></td>
                <td id="at_e_poke2"></td>
            </tr>
            <tr>
                <td>Defensa</td>
                <td id="def_poke1"></td>
                <td id="win_def"></td>
                <td id="def_poke2"></td>
            </tr>
            <tr>
                <td>Defensa Especial</td>
                <td id="def_e_poke1"></td>
                <td id="win_def_e"></td>
                <td id="def_e_poke2"></td>
            </tr>
            <tr>
                <td>Velocitat</td>
                <td id="vel_poke1"></td>
                <td id="win_vel"></td>
                <td id="vel_poke2"></td>
            </tr>
               <tr>
                <td>Altura</td>
                <td id="altura_poke1"></td>
                <td id="win_altura"></td>
                <td id="altura_poke2"></td>
            </tr>
            <tr>
                <td>Pes</td>
                <td id="pes_poke1"></td>
                <td id="win_pes"></td>
                <td id="pes_poke2"></td>
            </tr>
        </table>
    </div>
    <div id="winer">
    <table>
        <tr>
            <td>La victoria</td>
            <td id="nom_winer"></td>
            <img src="" alt="">
        </tr>
    </table>
    </div>
    </div>
</body>`

partsup.appendChild(conteinner);
document.body.appendChild(partsup);/* inseri dins el body*/

const pokeconsult = document.querySelector("#btn_comparar");
const input1 = document.querySelector("#input_poke1");
const input2 = document.querySelector("#input_poke2")

pokeconsult.addEventListener("click", function(){
const selectpoke1 = input1.value;
const selectpoke2 = input2.value;

const poke1 = fetch (`https://pokeapi.co/api/v2/pokemon/${selectpoke1}`);
const poke2 = fetch (`https://pokeapi.co/api/v2/pokemon/${selectpoke2}`);


Promise.all([poke1, poke2])
    .then(consulta => Promise.all(
        consulta.map(resultat => resultat.json())))
    .then(([dades1, dades2])=>
    {
        //contador puntos para ganar
        let puntosPoke1 = 0;
        let puntosPoke2 = 0;
// selector i insercions a les taules
        //vida poke1 i poke2
        const hp1 = document.querySelector("#p1_vida").textContent = dades1.stats[0].base_stat;
        const hp2 = document.querySelector("#p2_vida").textContent = dades2.stats[0].base_stat;

        //atac poke1 i poke2
        const atac1 = document.querySelector("#p1_atac").textContent = dades1.stats[1].base_stat;
        const atac2 = document.querySelector("#p2_atac").textContent =dades2.stats[1].base_stat;

        //defensa poke1 i poke2
        const defensa1 = document.querySelector("#p1_def").textContent=dades1.stats[2].base_stat;
        const defensa2 = document.querySelector("#p2_def").textContent = dades2.stats[2].base_stat;

        //atac especial poke1 i poke2
        const atacE1 = document.querySelector("#p1_atac_e").textContent = dades1.stats[3].base_stat;
        const atacE2 = document.querySelector("#p2_atac_e").textContent = dades2.stats[3].base_stat;

        //defensa especial poke1 i poke2
        const defensaE1 = document.querySelector("#p1_def_e").textContent = dades1.stats[4].base_stat;
        const defensaE2 = document.querySelector("#p2_def_e").textContent = dades2.stats[4].base_stat;

        //velocitat poke1 i poke2
        const velo1 = document.querySelector("#p1_vel").textContent = dades1.stats[5].base_stat;
        const velo2 = document.querySelector("#p2_vel").textContent = dades2.stats[5].base_stat;

        //altura poke1 i poke2
        const altu1 = document.querySelector("#p1_altura").textContent = dades1.height;
        const altu2 = document.querySelector("#p2_altura").textContent = dades2.height;

        //pes poke1 i poke2
        const peso1 = document.querySelector("#p1_pes").textContent = dades1.weight;
        const peso2 = document.querySelector("#p2_pes").textContent = dades2.weight;


        // creacio de la comparativa del estats del pokemon
        const hp = dades1.stats[0].base_stat > dades2.stats[0].base_stat ? dades1.name : dades2.name;
        if(hp1>hp2){
            puntosPoke1++;
        } else if (hp1<hp2){
            puntosPoke2++;
        }
        const atac= dades1.stats[1].base_stat > dades2.stats[1].base_stat ? dades1.name : dades2.name;
        if(atac1>atac2){
        puntosPoke1++;
        }else if (atac1<atac2){
            puntosPoke2++;
        }
        const defensa = dades1.stats[2].base_stat > dades2.stats[2].base_stat ? dades1.name : dades2.name;
        if(defensa1>defensa2){
            puntosPoke1++;
        } else if (defensa1<defensa2){
            puntosPoke2++;
        }
        const atacE = dades1.stats[3].base_stat > dades2.stats[3].base_stat ? dades1.name : dades2.name;
        if(atacE1>atacE2){
            puntosPoke1++;
        } else if (atacE1<atacE2){
            puntosPoke2++;
        }
        const defensaE = dades1.stats[4].base_stat > dades2.stats[4].base_stat ? dades1.name : dades2.name;
        if(defensaE1>defensaE2){
            puntosPoke1++;
        } else if (defensaE1<defensaE2){
            puntosPoke2++;
        }
        const velo = dades1.stats[5].base_stat > dades2.stats[5].base_stat ? dades1.name : dades2.name;
        if(velo1>velo2){
            puntosPoke1++;
        } else if (velo1<velo2){
            puntosPoke2++;
        }
        const altura = dades1.height/10 > dades2.height/10 ? dades1.name : dades2.name;
        if(altu1>altu2){
            puntosPoke1++;
        } else if (altu1<altu2){
            puntosPoke2++;
        }
        const peso = dades1.weight/10 > dades2.weight/10 ? dades1.name: dades2.name;
        if(peso1>peso2){
            puntosPoke1++;
        } else if (peso1<peso2){
            puntosPoke2++;
        }

        //comparativa vida
        const vida_poke1 = document.querySelector("#vida_poke1").textContent =hp1;
        const vida_poke2 = document.querySelector("#vida_poke2").textContent = hp2;
        const win_vida = document.querySelector("#win_vida").textContent = hp;
        //comparativa atac
        const atac_poke1= document.querySelector("#atac_poke1").textContent = atac1;
        const atac_poke2 = document.querySelector("#atac_poke2").textContent = atac2;
        const win_atac = document.querySelector("#win_atac").textContent = atac;
        //comparativa defensa
        const def_poke1 = document.querySelector("#def_poke1").textContent =defensa1;
        const def_poke2 = document.querySelector("#def_poke2").textContent =defensa2;
        const win_def = document.querySelector("#win_def").textContent = defensa;
        //comparativa atac especial
        const at_e_poke1 = document.querySelector("#at_e_poke1").textContent =atacE1;
        const at_e_poke2 = document.querySelector("#at_e_poke2").textContent =atacE2;
        const win_at_e = document.querySelector("#win_at_e").textContent = atacE;
        //comparativa defensa
        const def_e_poke1 = document.querySelector("#def_e_poke1").textContent =defensaE1;
        const def_e_poke2 = document.querySelector("#def_e_poke2").textContent =defensaE2;
        const win_def_e = document.querySelector("#win_def_e").textContent = defensaE;
        //comparativa velocitat
        const vel_poke1 = document.querySelector("#vel_poke1").textContent =velo1;
        const vel_poke2 = document.querySelector("#vel_poke2").textContent =velo2;
        const win_vel = document.querySelector("#win_vel").textContent = velo;
        //comparativa altura
        const altu_poke1 = document.querySelector("#altura_poke1").textContent =altu1;
        const altu_poke2 = document.querySelector("#altura_poke2").textContent =altu2;
        const win_alt = document.querySelector("#win_altura").textContent = altura;
        //comparativa pese
        const peso_poke1 = document.querySelector("#pes_poke1").textContent =peso1;
        const peso_poke2 = document.querySelector("#pes_poke2").textContent =peso2;
        const win_pes = document.querySelector("#win_pes").textContent = peso

        let puntosWin = puntosPoke1 > puntosPoke2 ? dades1.name : dades2.name;
        const punt_winer = document.querySelector("#nom_winer").textContent = puntosWin;

})

})