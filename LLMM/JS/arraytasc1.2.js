let a=[7, -1, -2, 1, 5, 8];
let numGran=0;
let numPeti=0;
for (let i=0; i < a.length; i++){
    if(numGran <= Number(a[i])){
        numGran=Number(a[i]);
    }
};

console.log (numGran);