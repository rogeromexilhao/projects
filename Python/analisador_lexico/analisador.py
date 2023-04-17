# codigo = open('codigo1.txt', 'r')

#Rodrigo Lago Sardin
#RA: 176921

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
letras = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
          'u', 'v', 'w', 'x', 'y', 'z']
simbolos = ['!', ';', ':', '=', '{', '}']
operadores=['-','+','*','/','<', '>']
relacao=['<>','>=','<=','=','<','>']
tipos_var=['integer','double','str','char']
tokensTOP = []
lista=[]
cont = 0
print('START LEXICAL ANALISER -------------------------')
condition = False

with open("codigo1.txt") as file:
    for line in file:
        line=line.rstrip('\n')
        line2 = line.strip("\n") + " "
        lista.append(line2)
        palavra_numero = line
        vet = []
        cont+=1

        tokens = palavra_numero.split()  # Simplesmente divide a entrada em espaços em branco para simular os tokens
        token_atual = tokens.pop(0)

        try:
            Ndigitos = len(palavra_numero)
            for j in palavra_numero:
                vet.append(j)
        except:
            Ndigitos = 0

        try:
            atr = palavra_numero.index('=')
        except:
            atr = 0     

        print(' ')

        print('line'+str(cont)+': '+palavra_numero)


        def discover_type(word):
            
            if ':=' in palavra_numero:
                atribuição()
            if 'procedure' in palavra_numero:
                tokensTOP.append('<dc_p>')
                print('Token: <dc_p>')

            if Ndigitos == 0:
                if type(word) is int:
                    print('integer -> ', palavra_numero)
                elif type(word) is bool:
                    print('boolean -> ', palavra_numero)
                else:
                    print('float -> ', palavra_numero)
            elif Ndigitos != 0:
                if type(word) is str and Ndigitos == 1:
                    discover_type_char(word)
                elif type(word) is str and Ndigitos > 1:
                    discover_type_others(word)

        def atribuição():
            posicao_igual = None
            posicao_op = []
            aux = 0
            # Itera pela lista vet e verifica se há ','
            for i in vet:
                if i == '=':
                    posicao_igual = aux
                if vet[aux] in operadores:
                    posicao_op.append(aux)
                aux += 1

            if vet[len(palavra_numero)-1] != ';' :
                print('UnexpectedError: falta ; no final da linha')
                print('')
                exit()
            elif vet[posicao_igual-1] != ':':
                print('UnexpectedError: falta : para uma atribuição')
                print('')
                exit()
            elif vet[posicao_igual-1] == ':' and vet[0] == ':':
                print('SyntaxError: erro de atribuição inválida')
                print('')
                exit()
            elif not any(op in vet for op in operadores):
                print('UnexpectedError: Não há nenhum operador')
                print('')
                exit()
            elif len(posicao_op) > 0:
                for posicao in posicao_op:
                    if (vet[posicao-1] == ' ' and vet[posicao-2] == ' ') or (vet[posicao-1] == ' ' and vet[posicao-2] == '=') or vet[posicao-1] == '=':
                        print('UnexpectedError: falta um operando antes')
                        print('')
                        exit()
                    elif (vet[posicao+1] == ' ' and vet[posicao+2] == ';') or vet[posicao+1] == ';':
                        print('UnexpectedError: falta um operando depois')
                        print('')
                        exit()
                    elif (vet[posicao-1] in operadores) == True:
                        print('UnexpectedError: falta um operando')
                        print('')
                        exit()
            tokensTOP.append('<cmd>')
            print('Token: <cmd>')

        def discover_type_char(word):
            for i in letras:
                if i == word:
                    print('char -> ', palavra_numero)

            for i in simbolos:
                if i == word:
                    print('symbol -> ', palavra_numero)


        def discover_type_others(word):
            if vet[0] == ':' or vet[atr - 1] == ':':
                discover_type3(word)
            if vet[0] == 'v':
                discover_type3(word)
            elif vet[0] == 'b':
                discover_type3(word)
            elif vet[0] == 'p':
                discover_type3(word)
            elif vet[0] == '{':
                comentario()
            elif vet[0] == 'r':
                discover_type3(word)
            elif vet[0] == 'w':
                discover_type3(word)
            elif vet[0] == 'e':
                discover_type3(word)
            elif vet[0] == 'i':
                discover_type3(word)

        def comentario():
            if vet[len(palavra_numero)-1] == '}':
                tokensTOP.append('pass')
                print('Token: pass')
            else:
                print('UnexpectedError: falta } para fechar o comentario')
                print('')
                exit()


        def discover_type3(word):
            if vet[1] == 'a':
                discover_type4(word)
            elif vet[1] == 'e':
                discover_type4(word)
            elif vet[1] == 'r':
                discover_type4(word)
            elif vet[1] == 'h':
                discover_type4(word)
            elif vet[1] == 'n':
                discover_type4(word)
            elif vet[1] == 'f':
                discover_type4(word)
            elif vet[1] == 'l':
                discover_type4(word)


        def discover_type4(word):
            if vet[2] == 'r':
                discover_type5(word)
            elif vet[2] == 'g':
                discover_type5(word)
            elif vet[2] == 'o':
                discover_type5(word)
            elif vet[2] == 'a':
                discover_type5(word)
            elif vet[2] == 'i':
                discover_type5(word)
            elif vet[2] == 'd':
                end()
            elif vet[2] == ' ':
                ifDeclaration()
            elif vet[2] == 's':
                discover_type5(word)

        def ifDeclaration():
            validação = None
            posica = 0
            for r in relacao:
                if r in palavra_numero:
                    validação = True
                    break
                else:
                    validação = False

            palavrajunta = palavra_numero.replace(' ','')

            for k in palavrajunta:
                if k == '=' or k == '>' or k == '<':
                    break

            if vet[len(palavra_numero)-1] == ';':
                print('UnexpectedError: não é necessario ;')
                print('')
                exit()
            elif validação == False:
                print('SyntaxError: syntax invalida é necessario um operador de comparação')
                print('')
                exit()
            elif ('then' in palavra_numero) == False:
                print('UnexectedError: falta a palavra then')
                print('')
                exit()
            elif palavrajunta[2] == '<' or palavrajunta[posica+1] == 't':
                print('SyntaxError: syntax invalida é necessario um valor para condição')
                print('')
                exit()

            tokensTOP.append('<cmd>')
            print('Token: <cmd>')

        def end():
            tokensTOP.append('end')
            print('Token: end')
            

        def discover_type5(word):
            if vet[3] == 'i':
                discover_type6(word)
            elif vet[3] == ' ':
                variable_declaration()
            elif vet[3] == 'g':
                discover_type6(word)
            elif vet[3] == 'd':
                discover_type6(word)
            elif vet[3] == 'l':
                discover_type6(word)
            elif vet[3] == 't':
                discover_type6(word)
            elif vet[3] == 'e':
                elseDeclaration()
        
        def elseDeclaration():
            print('else')


        def variable_declaration():
            if vet[len(palavra_numero)-1] != ';' :
                print('UnexpectedError: falta ; no final da linha')
                print('')
                exit()
            elif (':' in vet) == False:
                print('UnexpectedError: falta : para a declaração do tipo da variavel')
                print('')
                exit()
            elif (':' in vet) == True and vet[palavra_numero.index(':')-1] == ',' :
                print('UnexpectedError: falta declaração de variavel')
                print('')
                exit()
            elif (':' in vet) == True and vet[palavra_numero.index(':')+1] == ';' or vet[palavra_numero.index(':')+2] == ';':
                print('SyntaxError: tipo var não declarada')
                print('')
                exit()
            elif (':' in vet) == True and (',' in vet) == True:
                posicoes_virgula = []
                # Itera pela lista vet e verifica se há ','
                for i, elemento in enumerate(vet):
                    if elemento == ',':
                        posicoes_virgula.append(i)

                for x in posicoes_virgula:
                    if vet[x-1] == ',' or vet[x-1] == ' ':
                        print('UnexpectedError: falta declaração de variavel')
                        print('')
                        exit()

            tokensTOP.append('<dc_v>')
            print('Token: <dc_v>')


        def discover_type6(word):
            if vet[4] == 'n':
                begin()
            elif vet[4] == 'r':
                discover_type7(word)
            elif vet[4] == 'e':
                discover_type7(word)
            elif vet[4] == ' ':
                read()

        def read():
            if vet[len(palavra_numero)-1] != ';':
                print('UnexpectedError: falta ; no final da linha')
                print('')
                exit()
            elif(')' in vet) == False:
                print('UnexpectedError: é necessario fachar os parentes')
                print('')
                exit()
            elif(')' in vet) == True and (',' in vet) == True:
                posicoes_virgula = []
                # Itera pela lista vet e verifica se há ','
                for i, elemento in enumerate(vet):
                    if elemento == ',':
                        posicoes_virgula.append(i)
                for x in posicoes_virgula:
                    if vet[x-1] == '(' or vet[x-1] == ' ':
                        print('UnexpectedError: falta a declaração da variavel')
                        print('')
                        exit()
                    elif vet[x+1] == ')' or vet[x+1] == ' ':
                        print('UnexpectedError: falta a declaração da variavel')
                        print('')
                        exit()
            
            tokensTOP.append('<cmd>')
            print('Token: <cmd>')


        def begin():
            if vet[len(palavra_numero)-1] == ';':
                print('UnexpectedError: begin não aceita ;')
                print('')
                exit()
            else:
                tokensTOP.append('begin')
                print('Token: begin')


        def discover_type7(word):
            if vet[5] == 'a':
                discover_type8(word)
            elif 'while' in palavra_numero:
                whiledeclaration()
            elif 'write' in palavra_numero:
                write()

        def write():
            if vet[len(palavra_numero)-1] != ';' :
                print('UnexpectedError: falta ; no final da linha')
                print('')
                exit()
            elif vet[6] != '(' or (')' in vet) == False:
                print('SyntaxError:  syntaxe invalida falta ( ou )')
                print('')
                exit()
            elif vet[6] == ' ' or vet[6] == ')':
                print('SyntaxError: syntaxe invalida passe a menos paraetro')
                print('')
                exit()
            
            tokensTOP.append('<cmd>')
            print('Token: <cmd>')

        def whiledeclaration():
            position = []
            for i in range(len(vet)):
                if vet[i] in operadores:
                    position.append(i)

            if len(position) == 0:
                print('SyntaxError: não ha nenhuma condição valida')
                print('')
                exit()
            elif vet[len(palavra_numero)-1] == ';':
                print('UnexpectedError: while não aceita ;')
                print('')
                exit()
            elif vet[len(palavra_numero)-1] != 'o':
                print('SyntaxError: declaração invalida do while')
                print('')
                exit()
            elif vet[len(palavra_numero)-2] != 'd':
                print('SyntaxError: declaração invalida do while')
                print('')
                exit()
            elif len(position) > 0: 
                for posicao in position:
                    if vet[posicao-2] == ' ' or vet[posicao+2] == ' ': 
                        print('SyntaxError: não ha nenhuma condição valida')
                        print('')
                        exit()

            tokensTOP.append('<cmd>')
            print('Token: <cmd>')

        def discover_type8(word):
            if vet[6] == 'm':
                discover_type9(word)

        def discover_type9(word):
            if vet[7] == ' ':
                start_program()

        # declaração inicio do programa
        def start_program():
            if vet[len(palavra_numero)-1] == ';':
                print('Tokens: <programa>')
                tokensTOP.append('<programa>')
                #sintaticalAnaliser('<programa>')
            else:
                print('UnexpectedError: falta ; no final da linha ou nome do programa')
                print('')
                exit()

        discover_type(palavra_numero)

        
#analisador sintatico ----------------------------------------------------------------------------------
def sintaticalAnaliser():
    #aux é a linha selecionado c split
    #tokensTOP são os tokens indentificados 
    #lista é tds as linhas do arquivo em forma de vetor ou seja linha 0 na posição 0

    if tokensTOP[0] == '<programa>':
        global aux 
        aux = lista[0].split(' ')
        if aux[0] == 'program':
            aux.pop(0)
            #verifica()
            if aux[0].isidentifier():
                print('indet')
                aux.pop(0)
                #verifica()
                if aux[0] == ';':
                    print('<corpo>')
                    print('<dc>')
                    print('<dc_v>')
                    aux.pop(0)
                    verifica()
                    if tokensTOP[0] == '<dc_v>':
                        print('<var>')
                        print('<variaveis>')
                        aux.pop(0)
                        #verifica()
                        if aux[0].isidentifier() or ',' in aux[0]:
                            print('var indet')
                            aux.pop(0)
                            #verifica()
                            if aux[0] == ':':
                                print('type')
                                aux.pop(0)
                                #verifica()
                                print(aux)
                                if aux[0] in tipos_var:
                                    print('validada o tipo var')
                                    aux.pop(0)
                                    #verifica()
                                    if aux[0] == ';':
                                        aux.pop(0)
                                        verifica()
                                        if aux[0] == 'procedure':
                                            pass
                                        elif aux[0] == 'begin':
                                            aux.pop(0)
                                            verifica()
                                            print('<comandos>')
                                            while tokensTOP[0]=='<cmd>':
                                                if aux[0] == 'read':
                                                    aux.pop(0)
                                                    #verifica()
                                                    if aux[0] == '(':
                                                        aux.pop(0)
                                                        #verifica()
                                                        if aux[0].isidentifier() or ',' in aux[0]:
                                                            aux.pop(0)
                                                            #verifica()
                                                            if aux[0] == ')':
                                                                aux.pop(0)
                                                                #verifica()
                                                                if aux[0] == ';':
                                                                    aux.pop(0)
                                                                    verifica()
                                                elif 'write' in aux[0]:
                                                    print('write')
                                                    aux.pop(0)
                                                    #verifica()
                                                    if aux[0] == '(':
                                                        aux.pop(0)
                                                        #verifica()
                                                        if aux[0].isidentifier() or ',' in aux[0]:
                                                            aux.pop(0)
                                                            #verifica()
                                                            if aux[0] == ')':
                                                                aux.pop(0)
                                                                #verifica()
                                                                if aux[0] == ';':
                                                                    aux.pop(0)
                                                                    verifica()
                                                                    exit()
                                                elif 'while' in aux[0]:
                                                    print('while')
                                                    aux.pop(0)
                                                    #verifica()
                                                    while aux[0] != 'do':
                                                        if aux[0].isidentifier():
                                                            aux.pop(0)
                                                            #verifica()
                                                            if aux[0] in operadores:
                                                                aux.pop(0)
                                                    aux.pop(0)
                                                    verifica()
                                                    if aux[0] == 'begin':
                                                        aux.pop(0)
                                                        verifica()
                                                        #beginloop()
                                                elif 'if' in aux[0]:
                                                    print('if')
                                                elif ':=' in aux[0]:
                                                    aux.pop(0)
                                                    #verifica()
                                                    while aux[0] != ';':
                                                        if aux[0].isidentifier():
                                                            aux.pop(0)
                                                            #verifica()
                                                            if aux[0] in operadores:
                                                                aux.pop(0)
                                                    aux.pop(0)
                                                    verifica()
                                                else:
                                                    print('erro9')
                                        else:
                                            print('error8')
                                    else:
                                        print('error7')
                                else:
                                    print('error6')                                                
                        else:
                            print('error5')
                    else:
                        print('error4')
                else:
                    print('error3') 
            else:
                print('error2')
        else:
            print('error1')
        
def verifica():
    global aux
    if aux[0] == '':
        print('entrou')
        lista.pop(0)
        tokensTOP.pop(0)
        if tokensTOP[0] == 'pass':
            lista.pop(0)
            tokensTOP.pop(0)
        aux = lista[0].split(' ')
        #print(lista)
        #print(tokensTOP)
        print(aux)

def beginloop():
    print('ta asjkdajskldlaks')
    while tokensTOP[0]!='end':
        if aux[0] == 'read':
            aux.pop(0)
            #verifica()
            if aux[0] == '(':
                aux.pop(0)
                #verifica()
                if aux[0].isidentifier() or ',' in aux[0]:
                    aux.pop(0)
                    #verifica()
                    if aux[0] == ')':
                        aux.pop(0)
                        #verifica()
                        if aux[0] == ';':
                            aux.pop(0)
                            verifica()
        elif 'write' in aux[0]:
            print('write')
            exit()
        elif 'while' in aux[0]:
            print('while')
            aux.pop(0)
            #verifica()
            while aux[0] != 'do':
                if aux[0].isidentifier():
                    aux.pop(0)
                    #verifica()
                    if aux[0] in operadores:
                        aux.pop(0)
            aux.pop(0)
            verifica()
            if aux[0] == 'begin':
                aux.pop(0)
                verifica()
                beginloop()
        elif 'if' in aux[0]:
            print('if')
        elif ':=' in aux[0]:
            aux.pop(0)
            #verifica()
            while aux[0] != ';':
                if aux[0].isidentifier():
                    aux.pop(0)
                    #verifica()
                    if aux[0] in operadores:
                        aux.pop(0)
            aux.pop(0)
            verifica()
        else:
            print('erro9')
    exit()

        

    
def nextToken():
    print('entyr')
    global token_atual
    if len(tokens) > 0:
        token_atual = tokens.pop(0)
    else:
        token_atual = None

print(tokensTOP)
sintaticalAnaliser()

#print(lista)
# print(codigo)
