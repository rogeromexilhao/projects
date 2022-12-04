function conversaoToF(tempC){
    console.log('conversão de °C p/ °F')
    F = Number(tempC) * 1.8 + 32
    console.log(tempC+'°C é = °'+F+'F')
    //return console.log(F)
}

function conversaoToC(tempF){
    console.log('conversão de °F p/ °C')
    C = (Number(tempF)-32) * (5/9)
    console.log(tempF+'°F é = °'+C+'C')
    //return console.log(C)
}

conversaoToF('27')
conversaoToC('50')