const caixa = {
    receitas:[],
    despesas:[]
}

let totalR = 0 
let totalD = 0

for (let i = 0; i < 5; i++) {
    caixa.receitas[i] = Math.floor(Math.random()*5000);   
    totalR = caixa.receitas[i] + totalR

    caixa.despesas[i] = Math.floor(Math.random()*5000);
    totalD = caixa.despesas[i] + totalD
}

console.log(caixa.receitas);
console.log('total de receitas: R$' + totalR);
console.log(caixa.despesas);
console.log('total de despesas: R$' + totalD);

let conta = totalR - totalD;

if (conta > 0) {
    console.log("saldo positivo de : R$" + conta);
}
else{
    console.log("no saldo negativo de : R$" + conta);
}