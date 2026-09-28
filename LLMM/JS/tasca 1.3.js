let result=0;
let num = prompt("Introdueix primer nombre");
while(num !=0){
    result += Number(num);
    num = prompt("Introdueix altre nombre");
}
console.log(result)