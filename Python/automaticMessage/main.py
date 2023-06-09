from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import schedule
import time

# Configurar o caminho para o ChromeDriver
caminho_chromedriver = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'

# Número do contato (incluindo o código do país, sem espaços ou caracteres especiais)
numero_contato = '+5567999855979'

# Mensagem a ser enviada
mensagem = 'Olá! Esta é uma mensagem automática.'

def enviar_mensagem_whatsapp():
    # Iniciar o navegador Chrome
    driver = webdriver.Chrome(executable_path=caminho_chromedriver)
    
    # Abrir o WhatsApp Web
    driver.get('https://web.whatsapp.com')
    
    # Aguardar alguns segundos para escanear o código QR manualmente
    time.sleep(10)
    
    # Localizar o campo de pesquisa
    campo_pesquisa = driver.find_element_by_xpath('//div[@contenteditable="true"][@data-tab="3"]')
    
    # Pesquisar pelo número do contato
    campo_pesquisa.send_keys(numero_contato + Keys.ENTER)
    
    # Aguardar alguns segundos para carregar o chat
    time.sleep(5)
    
    # Localizar o campo de mensagem
    campo_mensagem = driver.find_element_by_xpath('//div[@contenteditable="true"][@data-tab="6"]')
    
    # Digitar a mensagem e enviar
    campo_mensagem.send_keys(mensagem + Keys.ENTER)
    
    # Aguardar alguns segundos para enviar a mensagem
    time.sleep(5)
    
    # Fechar o navegador
    driver.quit()

# Horário em que a mensagem será enviada (no formato HH:MM)
horario_envio = '08:00'

# Agendar o envio diariamente no horário especificado
#schedule.every().day.at(horario_envio).do(enviar_mensagem_whatsapp)

# Executar o agendador em um loop infinito
while True:
    schedule.run_pending()
    time.sleep(1)