


function classificaTemperatura(){

graus = Number(prompt("Cuantos grados hay? "))

    switch (graus){
        case 0:
           /* alert(graus)*/
            console.log("Congelacion");
            break;

        case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9: case 10:
            /*alert (graus);*/
            console.log("Fred");  
            break;
            
        case 11: case 12: case 13: case 14: case 15: case 16: case 17: case 18: case 19: case 20:
            console.log("fres");
            break;
            
        case 21: case 22: case 23: case 24: case 25: case 26: case 27: case 28: case 29: case 30:
            console.log("temprerat");
         default:
                console.log("Calor");
                break;   
    }

}

classificaTemperatura();