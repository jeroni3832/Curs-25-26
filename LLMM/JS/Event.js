document.querySelector("button").addEventListener("click",cambiarcolor)
function cambiarcolor() {
    document.querySelector("h1").style.color="red"
    document.querySelector("h1").textContent="Adeu"
    const paragraf = document.createElement("P");
    paragraf.style.color = "red";
    paragraf.textContent=" Chau";

    document.body.appendChild(paragraf);

}