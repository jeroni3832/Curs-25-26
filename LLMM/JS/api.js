/*part del html*/

const partsup = document.createElement("div")
partsup.classList.add("partsup")
const contenedor1 = document.querySelector("body");

const titol1 = document.createElement("h1");
titol1.classList.add("titol1")
titol1.textContent = "Api del tiempo";
partsup.appendChild(titol1);

/* inserir label, input, button, paragraf i imatje*/
const conteinner = document.createElement("div");
conteinner.classList.add("inner");
partsup.appendChild(conteinner);
conteinner.innerHTML = // creacion del contendido del conetener que inyecta en el html
    `<label for="nom">A la Ubicacio</label>
     <input type="text" name="nom" id="nom">
     <button id="btnbuscar">Consulta Clima🌦️</button>
     <p id="info"></p>
     <img id="imatjeclima" src="">
     `
     ;

partsup.appendChild(conteinner);
document.body.appendChild(partsup);/* inseri dins el body*/


/*boto de impresio del clima*/
const botoclima = document.querySelector("#btnbuscar");
const input = document.querySelector("#nom");//selector de la ubicacion
const apiKey = "40fb542d626d7374518f02ae73f58f91"
//funcio del boto consultar clima
botoclima.addEventListener("click", function(){
    const ubicacion = input.value;// capturar el input
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${ubicacion}&units=metric&appid=${apiKey}`

fetch(url)
    .then (resposta =>{
        return resposta.json();
    })

    .then (dad => {
        let cel = "";
        const p =document.querySelector("#info");// selecionar la informacion que va en el html
        const imatja = document.querySelector("#imatjeclima");

        console.log(dad)
        if (dad.weather[0].description == 'clear sky') {
            cel = "Soletjat";
            imatja.src = "https://openweathermap.org/img/wn/01d@2x.png";
        }
        else if (dad.weather[0].description == 'few clouds') {
            cel = "Pocs núvols ";
            imatja.src = "https://openweathermap.org/img/wn/02d@2x.png";
        }
        else if (dad.weather[0].description == 'cloud') {
            cel = "Núvols ";
            imatja.src = "https://openweathermap.org/img/wn/03d@2x.png";
        }
        else if (dad.weather[0].description == "scattered clouds") {
            cel = "Núvols dispersos";
            imatja.src="https://openweathermap.org/img/wn/03d@2x.png"
        }
        else if (dad.weather[0].description == 'broken clouds') {
            cel = "Núvols trencats ";
            imatja.src = "https://openweathermap.org/img/wn/04d@2x.png";
        }
        else if (dad.weather[0].description == 'rain') {
            cel = "Pluja ";
            imatja.src = "https://openweathermap.org/img/wn/10d@2x.png";
        }
        else if (dad.weather[0].description == 'thunderstorm') {
            cel = "Tempesta ";
            imatja.src = "https://openweathermap.org/img/wn/11d@2x.png";
        }

        else if (dad.weather[0].description == 'mist') {
            cel = "Boira ";
            imatja.src = "https://openweathermap.org/img/wn/50d@2x.png";
        }


        p.textContent = "A la Ubicacio de " + dad.name + "," +" la temperatura es de " + dad.main.temp + "Cº"+"," + " amb una humitat de " + dad.main.humidity + "%" + " amb un cel " + cel;//contingunt de la consulta a injectar en el html
        
    })
     .catch (error => {
        console.log("Error: ", error);
        
     })

})