//a pagina esta coniguranda um pouco errada 
//acredito que seja por conta do css que esta c alguma att
//o btn roxo n ta no centro e dps ele n some 
//o codigo html esta igual o ex da rocketseat 

const openModalButton = document.getElementById('openModal')

const modalWarpper = document.querySelector('.modal-warpper')

//add um evento no btn
openModalButton.onclick = function () {
    modalWarpper.classList.remove('invisible')
}

//add um evento no documento
//tanto é que quando apertamos o esc(a qualquer momento) ele vai entrar no if
//e como ele ja esta invisivel n acontece nd porem esta executando 

//DESEFIO -> fazer com que nao entre o tempo td na esc key

//codigo original
document.addEventListener('keydown', function (event) {
    const isEscKey = event.key === 'Escape'
    if(isEscKey){
        modalWarpper.classList.add('invisible')
        console.log('entrou')
    }
})


/*
modalWarpper.addEventListener('keydown', function (event) {
    //console.log(event)
    const isEscKey = event.key === 'Escape'
    console.log('entrou 1')
    if(isEscKey){
        console.log('entrou 2')
        modalWarpper.classList.add('invisible')
    }
})
*/ 

/* 
document.addEventListener('keydown', function (event) {
    const isEscKey = event.key === 'Escape'
    const vdd =  modalWarpper.classList.contains('invisible')
    if(isEscKey === true && vdd === false){
        modalWarpper.classList.add('invisible')
        console.log('entrou')
    }
    else{
        console.log('ja tem')
    }
})
*/






