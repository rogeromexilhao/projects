with open("codigo1.txt", "r") as texto:
    arquivo = texto.readlines()
    lista = []
    for linha in arquivo:
        line = linha.strip("\n") + " "
        lista.append(line)
texto.close()

print(lista)