import pandas as pd
import quantstats as qs
import matplotlib.pyplot as plt

# Carregar os dados
dados_empresas = pd.read_csv("./dados_empresas.csv")

# Calcular o retorno
dados_empresas['retorno'] = dados_empresas.groupby('ticker')['preco_fechamento_ajustado'].pct_change()
dados_empresas['retorno'] = dados_empresas.groupby('ticker')['retorno'].shift(-1)

# Filtrar por volume negociado
dados_empresas = dados_empresas[dados_empresas['volume_negociado'] > 1000000]

# Calcular rankings
dados_empresas['ranking_ev_ebit'] = dados_empresas.groupby('data')['ebit_ev'].rank(ascending=False)
dados_empresas['ranking_roic'] = dados_empresas.groupby('data')['roic'].rank(ascending=False)

# Calcular ranking final
dados_empresas['ranking_final'] = dados_empresas['ranking_ev_ebit'] + dados_empresas['ranking_roic']
dados_empresas['ranking_final'] = dados_empresas.groupby('data')['ranking_final'].rank()

# Filtrar dados para uma data específica
dados_empresas[dados_empresas['data'] == '2017-06-30'].sort_values('ranking_final').head(20)

# Filtrar pelos top 10 rankings
dados_empresas = dados_empresas[dados_empresas['ranking_final'] <= 10]

# Calcular a rentabilidade por carteiras
rentabilidade_por_carteiras = dados_empresas.groupby('data')['retorno'].mean()
rentabilidade_por_carteiras = rentabilidade_por_carteiras.to_frame()

# Calcular a rentabilidade acumulada da Magic Formula
rentabilidade_por_carteiras['Magic Formula'] = (rentabilidade_por_carteiras['retorno'] + 1).cumprod() - 1

# Ajustar os dados
rentabilidade_por_carteiras = rentabilidade_por_carteiras.shift(1)
rentabilidade_por_carteiras = rentabilidade_por_carteiras.dropna()

# Carregar os dados do Ibovespa
ibov = pd.read_csv('ibov.csv')

# Calcular os retornos do Ibovespa
retornos_ibov = ibov['fechamento'].pct_change().dropna()
retorno_acum_ibov = (1 + retornos_ibov).cumprod() - 1
rentabilidade_por_carteiras['Ibovespa'] = retorno_acum_ibov.values
rentabilidade_por_carteiras = rentabilidade_por_carteiras.drop('retorno', axis=1)

# Estender pandas com quantstats
qs.extend_pandas()
rentabilidade_por_carteiras.index = pd.to_datetime(rentabilidade_por_carteiras.index)

# Plotar os gráficos
#fig1, ax1 = plt.subplots()
rentabilidade_por_carteiras['Magic Formula'].plot_monthly_heatmap()
#plt.show()  # Mostrar o primeiro gráfico

#fig2, ax2 = plt.subplots()
#rentabilidade_por_carteiras['Ibovespa'].plot_monthly_heatmap(ax=ax2)
#plt.show()  # Mostrar o segundo gráfico

#fig3, ax3 = plt.subplots(figsize=(7, 4))
#rentabilidade_por_carteiras.plot(ax=ax3)
#plt.show()  # Mostrar o terceiro gráfico

print(dados_empresas)
print(rentabilidade_por_carteiras)
