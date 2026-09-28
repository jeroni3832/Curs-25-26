// selector de llista de avanctures
const ciutatOrigen = document.querySelector("#ciutatOrigen");
const ciutatDesti = document.querySelector("#ciutatDesti");
const experiencia = document.querySelector("#experiencia");
const preu = document.querySelector("#preu");
const objectes = document.querySelector("#objectes");
const personesDesti = document.querySelector("#personesDesti");
const nivell = document.querySelector("#nivellMinim");
const descripcio = document.querySelector("#descripcio");
const boton = document.querySelector("#botonMissio");

// Funcio on replege tota la accio

function botoClick(){
    const valCiutatOrigen = ciutatOrigen.value;
    const valCiutatDesti = ciutatDesti.value;
    const valExperiencia = experiencia.value;
    const valPreu = preu.value;
    const valObjectes = objectes.value;
    const valPersonesDesti = personesDesti.value;
    const valNivell = nivell.value;
    const valDescripcio = descripcio.value;

    // Imprimir les dades al html atraves del javascript
    const novaLinea = document.createElement("tr");

    // Insersio de les dades a les casilles td que sa crean automaticament
    const td1 = document.createElement("td");
    td1.textContent ="De: " + valCiutatOrigen + " A: " + valCiutatDesti;
    td1.classList.add("ciutat");
    novaLinea.appendChild(td1);

    const td2 = document.createElement("td");
    td2.textContent = valExperiencia;
    td2.classList.add("exp");
    novaLinea.appendChild(td2);

    const td3 = document.createElement("td");
    td3.textContent = valPreu;
    td3.classList.add("preu");
    novaLinea.appendChild(td3);

    const td4 = document.createElement("td");
    td4.textContent = valObjectes;
    td4.classList.add("objectes");
    novaLinea.appendChild(td4);

    const td5 = document.createElement("td");
    td5.textContent = valPersonesDesti;
    td5.classList.add("persona");
    novaLinea.appendChild(td5);

    const td6 = document.createElement("td");
    td6.textContent = valNivell;
    td6.classList.add("nivell");
    novaLinea.appendChild(td6);

    const td7 = document.createElement("td");
    td7.textContent = valDescripcio;
    td7.classList.add("descripcio");
    novaLinea.appendChild(td7);

    const botones = document.createElement("td");
    const td8 = document.createElement("button");
    td8.classList.add("aceptar");
    td8.addEventListener("click", aceptar);
    botones.appendChild(td8);

    const td9 = document.createElement("button");
    td9.classList.add("eliminar");
    botones.appendChild(td9);

    novaLinea.appendChild(botones);

    // posar la nova fila dins de la taula
    document.querySelector("#llistaResultats").appendChild(novaLinea);
}
// es fa la crida de la funcio
boton.addEventListener("click", botoClick);

function aceptar(){
    const filaDatos = this.closest("tr");

    const conte = document.createElement("div")
    conte.classList.add("conte");

    const novaTaula = document.createElement("table");
    novaTaula.classList.add("taula");
    conte.appendChild(novaTaula);

    const novaLinea2 = document.createElement("tr");
    novaTaula.appendChild(novaLinea2);

    
    const td1 = document.createElement("td");
    td1.textContent ="De: " + CiutatOrigen + " A: " + CiutatDesti;
    const td10 = filaDatos.querySelector(".ciutat");
    td1.appendChild(td10)
    novaLinea2.appendChild(td1);

    const td2 = document.createElement("td");
    td2.textContent = valExperiencia;
    novaLinea2.appendChild(td2);

    const td3 = document.createElement("td");
    td3.textContent = valPreu;
    novaLinea2.appendChild(td3);

    const td4 = document.createElement("td");
    td4.textContent = valObjectes;
    novaLinea2.appendChild(td4);

    const td5 = document.createElement("td");
    td5.textContent = valPersonesDesti;
    novaLinea2.appendChild(td5);

    const td6 = document.createElement("td");
    td6.textContent = valNivell;
    novaLinea2.appendChild(td6);

    const td7 = document.createElement("td");
    td7.textContent = valDescripcio;
    novaLinea2.appendChild(td7);
    
    
     document.querySelector(".taula").appendChild(novaTaula);
}