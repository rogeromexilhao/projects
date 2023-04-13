import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib 
import datetime

#inserção dos ticker e do preço das compras
#esta falntando PVBI11, por algum motivo a biblioteca não acha
ativos = ['BBDC4.SA','TASA4.SA','SUZB3.SA','JBSS3.SA','KNCR11.SA','XPML11.SA','LVBI11.SA']
compras = {'BBDC4.SA':445.76,'TASA4.SA':222.30,'SUZB3.SA':470.90,'JBSS3.SA':452.88,'KNCR11.SA':1092.30,'XPML11.SA':1093.75,'LVBI11.SA':1080}

#data de inicio e final
inicio = '2023-02-01'
data_atual = datetime.date.today()
data_anterior = data_atual - datetime.timedelta(days=1)
#data do dia anterior
fim = data_anterior.strftime('%Y-%m-%d')
 
#ajuste dos dados
precos = yf.download(ativos, start = inicio, end = fim)['Adj Close']
precos.head()
precos.columns

#print do valor total das compras
print('Soma das compras: ',sum(compras.values()))

primeiro = precos.iloc[0]

list(compras.keys())

compras_df = pd.Series(data = compras, index = list(compras.keys()))

#qtd da cada ação comprada tem que dar uma ajustada ainda para ficar 100% 
qtd_acoes = compras_df/primeiro
print('qtd de cada ação', qtd_acoes)
print(qtd_acoes)


#fazendo calculos e ajustando para os mesmos indices
PL = precos*qtd_acoes
     
PL.head()

PL.tail()

PL['Carteira Total'] = PL.sum(axis = 1)

ibov = yf.download('^BVSP', start = inicio, end =  fim)
     
ibov.rename(columns = {'Adj Close': 'IBOV'}, inplace = True)
     
ibov.drop(ibov.columns[[0,1,2,3,5]], axis = 1, inplace = True)
     
ibov.head()

consolidado = pd.merge(ibov, PL, how = 'inner', on = 'Date')
     
consolidado.head()

#consolidado.plot()

consolidado_adj = consolidado/consolidado.iloc[0]
     
consolidado_adj.head()

consolidado_adj.tail()


#plot da carteira total x ibov 
consolidado_adj[['IBOV', 'Carteira Total']].plot()

#plot de tds ativos ibov e carteira total
consolidado_adj.plot()

#mostra os graficos
matplotlib.pyplot.show()