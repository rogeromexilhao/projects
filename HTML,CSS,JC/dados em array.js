const booksByCategory = [
    {
        category: "Riqueza",
        books: [
            {
                title: "Os segredos da mente milionária",
                author: "T. Harv Eker",
            },
            {
                title: "O homem mais rico da Babilônia",
                author: "George S. Clason",
            },
            {
                title: "Pai rico, pai pobre",
                author: "Robert T. Kiyosaki e Sharon L. Lechter",
            },
        ],
    },
    {
        category: "Inteligência Emocional",
        books: [
            {
                title: "Você é Insubstituível",
                author: "Augusto Cury",
            },
            {
                title: "Ansiedade – Como enfrentar o mal do século",
                author: "Augusto Cury",
            },
            {
                title: "Os 7 hábitos das pessoas altamente eficazes",
                author: "Stephen R. Covey",
            },
        ],
    },
];

console.log('qnt de categorias = '+booksByCategory.length)
console.log('onde as categorias sao: '+booksByCategory[0].category+' e '+booksByCategory[1].category)
console.log('qtd de livros categoria Riqueza: '+booksByCategory[0].books.length)
console.log('qtd de livros categoria Inteligencia Emocional: '+booksByCategory[1].books.length)

console.log('')

let listautor = []
for (let category of booksByCategory) {
    for (let book of category.books){
        if (listautor.indexOf(book.author) == -1) {
            listautor.push(book.author)
        }
    }
}
console.log('total de autores : '+listautor.length)

console.log('')

console.log('-----livros de Augusto Cury-----')
for (let category1 of booksByCategory) {
    for (let book1 of category1.books){
        if (book1.author == 'Augusto Cury') {
            console.log(book1.title)
        }
    }
}

console.log('')

function busca(buscaautor){
    let aux = 0
    console.log('Busca do(s) livro(s) pelo autor : '+buscaautor)
    for (let category1 of booksByCategory) {
        for (let book1 of category1.books){
            if (book1.author == buscaautor) {
                console.log(book1.title)
                aux = 1
            }
        }
    }
    
    if (aux == 0) {
        console.log('autor nao encontrado !!!')
    }
    console.log('')
}

busca('Augusto Cury')
busca('cleiton')
busca('Stephen R. Covey')
