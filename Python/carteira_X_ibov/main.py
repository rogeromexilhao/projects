import yfinance as yf
import matplotlib.pyplot as plt

# Lista de tickers das ações da carteira
carteira_tickers = ["TASA4.SA","JBSS3.SA","BBDC4.SA","SUZB3.SA","KNCR11.SA","XPML11.SA","PVBI11.SA"]

# Obter dados de preços das ações da carteira e do Ibovespa
carteira = yf.download(carteira_tickers, start="2022-01-01", end="2022-12-31")["Adj Close"]
ibov = yf.download("^BVSP", start="2022-01-01", end="2022-12-31")["Adj Close"]

# Calcular retornos diários
ret_carteira = carteira.pct_change().dropna()
ret_ibov = ibov.pct_change().dropna()

# Calcular retorno acumulado da carteira
ret_medio_carteira = ret_carteira.mean(axis=1)
cum_ret_carteira = (1 + ret_medio_carteira).cumprod()

# Plotar gráfico de retorno acumulado
cum_ret_ibov = (1 + ret_ibov).cumprod()

fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(cum_ret_carteira, label="Carteira")
ax.plot(cum_ret_ibov, label="Ibovespa")
ax.legend()

# Configura o eixo y para ter um formato com duas casas decimais e o símbolo de porcentagem
ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda x, _: '{:.2f}%'.format(x*100)))

plt.show()