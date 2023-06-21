const puppeteer = require('puppeteer');

async function extrairInformacoesCanetaBic() {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // Navegar para a página do produto no marketplace (por exemplo, Amazon)
  await page.goto('https://www.amazon.com.br/caneta-bic');

  // Aguardar o carregamento completo da página (opcional)
  await page.waitForLoad({ waitUntil: 'networkidle0' });

  // Extrair informações da página
  const nome = await page.$eval('.nome-produto', (element) => element.textContent);
  const preco = await page.$eval('.preco-produto', (element) => element.textContent);
  const descricao = await page.$eval('.descricao-produto', (element) => element.textContent);

  // Exibir as informações no console
  console.log('Nome: ', nome);
  console.log('Preço: ', preco);
  console.log('Descrição: ', descricao);

  await browser.close();
}

extrairInformacoesCanetaBic();