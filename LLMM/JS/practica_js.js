// asignacio de variable del formulari
const nomTasca = document.querySelector("#nomTasca");
const descripcio = document.querySelector("#descripcio");
const datein = document.querySelector("#datein");
const datefi = document.querySelector("#datefi");
const boton = document.querySelector("#boton");

// Creacio de la funcio que te el boto

function botoClick (){
  const valNomTasca = nomTasca.value; 
  if(valNomTasca ==''){
    window.alert("No as posat el nom" );
  }
  
  const valDescripcio = descripcio.value;
  if(valDescripcio==''){
    alert("No as posat la descripcio" )
  }
  
  const valDatein = datein.value;
  if(valDatein==''){
    alert("No as posat la data" )
  }
  const valDatefi = datefi.value;
  if(valDatefi==''){
    alert("No as posat la data" )
  }
  function validarForm(){
    
  }

  // Imprimir les dades al html atraves del javascript
  const novaLinea = document.createElement("tr");

  // Insersio de les dades a les casilles td que sa crean automaticament

  const td1 = document.createElement("td");
  td1.textContent = valNomTasca;
  novaLinea.appendChild(td1);

  const td2 = document.createElement("td");
  td2.textContent = valDescripcio;
  novaLinea.appendChild(td2);

  const td3 = document.createElement("td");
  td3.textContent = valDatein;
  novaLinea.appendChild(td3);

  const td4 = document.createElement("td");
  td4.textContent = valDatefi;
  novaLinea.appendChild(td4);

  document.querySelector("#llistaTasques").appendChild(novaLinea);
}

boton.addEventListener("click", botoClick);