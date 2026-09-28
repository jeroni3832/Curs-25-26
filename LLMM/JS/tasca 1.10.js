let notes=Number(prompt("Quantes notes vols"));
let notaIntroduida=0;
let notaTotal=0;
for(let i = 0; i <notes; i++ ){
    notaIntroduida = Number(prompt("Introdueix nota"));
    notaTotal += notaIntroduida;

}
console.log(Number(notaTotal/notes));