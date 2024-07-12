from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import pandas as pd

# Configuração do driver
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

# URL do site
url = 'https://www.fundamentus.com.br/resultado.php'

# Acessa a URL
driver.get(url)

# XPath da tabela
local_tabela = '/html/body/div[1]/div[2]/table'

# Encontra o elemento da tabela
elemento = driver.find_element("xpath", local_tabela)

# Obtém o HTML da tabela
html_tabela = elemento.get_attribute('outerHTML')

# Lê a tabela HTML em um DataFrame
tabelas = pd.read_html(html_tabela, thousands='.', decimal=',')

# Acessa o primeiro DataFrame da lista
tabela = tabelas[0]

# Define o índice e seleciona as colunas desejadas
tabela = tabela.set_index("Papel")
tabela = tabela[['Cotação', 'EV/EBIT', 'ROIC', 'Liq.2meses']]

tabela['ROIC'] = tabela['ROIC'].str.replace("%", "")
tabela['ROIC'] = tabela['ROIC'].str.replace(".", "")
tabela['ROIC'] = tabela['ROIC'].str.replace(",", ".")
tabela['ROIC'] = tabela['ROIC'].astype(float)

tabela = tabela[tabela['Liq.2meses'] > 1000000]

tabela = tabela[tabela['EV/EBIT'] > 0]
tabela = tabela[tabela['ROIC'] > 0]

tabela['ranking_ev_ebit'] = tabela['EV/EBIT'].rank(ascending = True)
tabela['ranking_roic'] = tabela['ROIC'].rank(ascending = False)
tabela['ranking_total'] = tabela['ranking_ev_ebit'] + tabela['ranking_roic']

tabela = tabela.sort_values('ranking_total')

# Imprime o DataFrame resultante
print(tabela.head(10))
print(tabela)

# Fecha o navegador
driver.quit()
