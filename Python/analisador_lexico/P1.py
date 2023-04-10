# codigo = open('codigo1.txt', 'r')

#Rodrigo Lago Sardin
#RA: 176921

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
letras = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
          'u', 'v', 'w', 'x', 'y', 'z']
simbolos = ['!', ';', ':', '=', '{', '}']
operadores=['-','+','*','/','<', '>']
tipos_var=['interger','double','str','char']

cont = 0
print('START LEXICAL ANALISER -------------------------')
condition = False
with open("codigo1.txt") as file:
    for line in file:
        line=line.rstrip('\n')
        palavra_numero = line
        vet = []
        cont+=1
        #print('\n')

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
            if Ndigitos == 0:
                if type(word) is int:
                    print('integer -> ', palavra_numero)
                elif type(word) is bool:
                    print('boolean -> ', palavra_numero)
                else:
                    print('float -> ', palavra_numero)
            elif '=' in vet:
                atribuição()
            elif Ndigitos != 0:
                if type(word) is str and Ndigitos == 1:
                    discover_type_char(word)
                elif type(word) is str and Ndigitos > 1:
                    discover_type_others(word)
            else:
                print('?????')

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
            elif vet[posicao_igual-2] == ' ' or (vet[posicao_igual-1] == ':' and vet[0] == ':'):
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
            print('Tokens: <condicao>')

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
                print('comentario')
            else:
                print('UnexpectedError: falta } para fechar o comentario')
                print('')
                exit()


        def discover_type3(word):
            if vet[1] == '=' or vet[atr] == '=':
                aux = palavra_numero.split(':')
                for a in palavra_numero:
                    if a in operadores:
                        simb = a
                aux2 = aux[1].split(simb)
                print(aux[0] + ' <variavel> <relação>:' + aux2[0] + ' <variavel> ' + vet[
                    palavra_numero.index(simb)] + ' <operador> <variavel>' + aux2[1])

            elif vet[1] == 'a':
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
            # declaração
            elif vet[2] == 'd':
                if vet[Ndigitos - 1] == ';':
                    print('<final_bloco> ' + palavra_numero)
                elif vet[Ndigitos - 1] == '.':
                    print('<final codigo>' + palavra_numero)
                else:
                    print('SyntaxError: invalid syntax')
            # declaração de if
            elif vet[2] == ' ':
                try:
                    aux = palavra_numero.split(' ')
                    print(
                        'if <cmd> ' + aux[1] + ' <variavel> ' + aux[2] + ' <condição> ' + aux[3] + ' <variavel> ' + aux[
                            4] + ' ' + aux[5] + ' <cmd> ')
                except:
                    pass




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


        def variable_declaration():
            if vet[len(palavra_numero)-1] != ';' :
                print('UnexpectedError: falta ; no final da linha')
                print('')
                exit()
            elif (':' in vet) == False:
                print('UnexpectedError: falta : para a declaração do tipo da variavel')
                print('')
                exit()
            elif (':' in vet) == True and vet[palavra_numero.index(':')-1] == ',' or vet[palavra_numero.index(':')-1] == ' ':
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

            print('Tokens: <dc_v>')


        def discover_type6(word):
            if vet[4] == 'n':
                begin()
            elif vet[4] == 'r':
                discover_type7(word)
            elif vet[4] == 'e':
                discover_type7(word)
            elif vet[4] == '(':
                read()
                #aux = palavra_numero.split('(')
                #print(aux[0] + ' <cmd>' + '(' + aux[1] + '<variaveis>')

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
            
            print('Tokens: <cmd>')


        def begin():
            if vet[len(palavra_numero)-1] == ';':
                print('UnexpectedError: begin não aceita ;')
                print('')
                exit()
            else:
                print('begin')


        def discover_type7(word):
            if vet[5] == 'a':
                discover_type8(word)
            elif vet[5] == ' ':
                whiledeclaration()
            else:
                write()

        def write():
            if vet[len(palavra_numero)-1] != ';' :
                print('UnexpectedError: falta ; no final da linha')
                print('')
                exit()
            elif vet[5] != '(' or (')' in vet) == False:
                print('UnexpectedError: ()')
                print('')
                exit()
            
            print('ok')
            exit()

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
                    if vet[posicao-1] == ' ' or vet[posicao+1] == ' ': 
                        print('SyntaxError: não ha nenhuma condição valida asdasd')
                        print('')
                        exit()

            print('Tokens: <cmd>')

        def discover_type8(word):
            if vet[6] == 'm':
                discover_type9(word)

        def discover_type9(word):
            if vet[7] == ' ':
                start_program()

        # declaração inicio do programa
        def start_program():
            if vet[len(palavra_numero)-1] == ';' and vet[len(palavra_numero)-2] != ' ':
                print('Tokens: programa ident; <corpo>')
            else:
                print('UnexpectedError: falta ; no final da linha ou nome do programa')
                print('')
                exit()

        discover_type(palavra_numero)
# print(codigo)