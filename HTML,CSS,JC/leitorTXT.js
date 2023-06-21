const { kill } = require('process');
fs.readFile('./sofrimento.txt', 'utf8' , (err, data) => {
  if (err) {
    console.error(err)
    return
  }

  const readline =  require('readline')

  const file = readline.createInterface({
    input: fs.createReadStream('sofrimento.txt'),
    output: process.stdout,
    terminal: false
  });
  var cont = 0
  file.on('line', (line) => {
    cont = cont+1
    const ocorrencia = (line.match(/,/g)||[]).length;
    const tamanho = line.length;
    console.log(line)
    console.log(ocorrencia)
    //console.log(tamanho)
    console.log(cont)
    const virgula = ','
    if (ocorrencia < 8){
      if(ocorrencia <= 5){
        kill()
      }if (ocorrencia == 7){
        const primeira = line.indexOf(',')
        //console.log(primeira)
        const nao_sei = line.substring(0,primeira+2)
        console.log(nao_sei)
        
        const textoparcial1 = line.substring(primeira+2,tamanho)
        const segunda = textoparcial1.indexOf(',')

        //console.log(segunda)
        //console.log(primeira+segunda)

        //console.log(line.substring(0,primeira+segunda+4))
        //console.log(line.substring(primeira+segunda+3,primeira+segunda+4))
        const comp = line.substring(primeira+segunda+3,primeira+segunda+4)
        const comp2 = line.substring(primeira+segunda+2,primeira+segunda+3)
        //console.log(line.substring(primeira+segunda+2,primeira+segunda+3))

        if(comp === ' ' ){
          const substit1 = textoparcial1.replace(/ /,',')
          line = nao_sei+substit1
          console.log(line)
        }else if(comp2 === '1' || comp2 === '2' || comp2 === '3' ||comp2 === '4' ||comp2 === '5' ||comp2 === '6' ||comp2 === '7' ||comp2 === '8' || comp2 === ',' ||comp2 === '0'||comp2 === '9'){
          //const substit1 = textoparcial1.replace(/ /,',,')
          //line = nao_sei+substit1
          //console.log(line)
          kill()
        }else{
          kill()
        }
      }if (ocorrencia == 6){
        const primeira = line.indexOf(',')
        //console.log(primeira)
        const nao_sei = line.substring(0,primeira)
        console.log(nao_sei)
        
        const textoparcial1 = line.substring(primeira+2,tamanho)
        const segunda = textoparcial1.indexOf(',')
        //console.log(segunda)
        //console.log(primeira+segunda)

        //console.log(line.substring(0,primeira+segunda+4))
        //console.log(line.substring(primeira+segunda+3,primeira+segunda+4))
        const comp = line.substring(primeira+segunda+3,primeira+segunda+4)
        const comp2 = line.substring(primeira+segunda+2,primeira+segunda+3)
        //console.log(line.substring(primeira+segunda+2,primeira+segunda+3))

        if(comp === ' ' ){
          const substit1 = textoparcial1.replace(/ /,',')
          line = nao_sei+substit1
          console.log('\n'+line+'\n')
          kill()
        }else if(comp2 === '1' || comp2 === '2' || comp2 === '3' ||comp2 === '4' ||comp2 === '5' ||comp2 === '6' ||comp2 === '7' ||comp2 === '8' || comp2 === ',' ||comp2 === '0'||comp2 === '9'){
          //const substit1 = textoparcial1.replace(/ /,',,')
          //line = nao_sei+substit1
          //console.log(line)
          kill()
        }else{
          kill()
        }
      }
    }
  });
})