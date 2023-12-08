import webbrowser


number = "67999601115"  # Substitua pelo número de telefone desejado
message = "Olá, como vai?"  # Substitua pela mensagem desejada

url = f"https://web.whatsapp.com/send?phone=55{number}&text={message}"

webbrowser.open(url)