import webbrowser


number = "67999835497"  # Substitua pelo número de telefone desejado
message = "Bom dia dr estou on"  # Substitua pela mensagem desejada

url = f"https://web.whatsapp.com/send?phone=55{number}&text={message}"

webbrowser.open(url)