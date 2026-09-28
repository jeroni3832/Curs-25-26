function obtenerPares(lista) {

    let a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    let numPar = [];

    for (let i = 0; i < a.length; i++) {
        if (array[i] % 2 === 0) {
            numPar.push(array[i]);
        }
    }
    return numPar;
}