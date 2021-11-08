import requests
from bs4 import BeautifulSoup
#from module_delphi import delphi_add_data
#from module_delphi import delphi_produto_info

def get_value(node, nome, valor_default=''):    
    campo = node.find(nome, class_="price-tag-fraction")
    if campo is None: 
        return valor_default
    return campo.text 

def get_cents(node, nome, valor_default=''):    
    campo = node.find(nome, class_="price-tag-cents")
    if campo is None: 
        return valor_default
    return campo.text 

headers = {'User_Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0'}
page = requests.get("https://lista.mercadolivre.com.br/mascara-pff2#D[A:mascara%20pff2]", headers)
soup = BeautifulSoup(page.content, "html.parser")
for div in soup.find_all("div", class_="ui-search-result__content-wrapper"):
    produto = div.find("div", class_="ui-search-item__group ui-search-item__group--title").text
    valor = get_value(div, "span") + "," +  get_cents(div, "span")
    #valor = div.find("span", class_="price-tag-fraction").text + "," + div.find("span", class_="price-tag-cents").text
    link = div.find("a", class_="ui-search-item__group__element ui-search-link")["href"]
    if div.find("p", class_="ui-search-item__shipping ui-search-item__shipping--free") == None:
        frete_gratis = False
    else:
        frete_gratis = True

    print('Product: ' + produto)
    print('Value: ' + valor)
    print('Link: ' + link)

    if frete_gratis:
        print('Free shipping')

#    delphi_produto_info.produto = produto
#    delphi_produto_info.valor = valor
#    delphi_produto_info.link = link
#    delphi_produto_info.frete_gratis = frete_gratis

#    delphi_add_data()

    print("==========================")