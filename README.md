# Innovation Lab - SaaS Infrastructure

## Descrição
Projeto em grupo da disciplina de Banco de Dados. O sistema gerencia uma loja
de moda feminina: catálogo de produtos por categoria, controle de estoque por
tamanho e cor, cadastro de clientes e registro de vendas.

## Integrantes do grupo
- Gabrielly Campos Buganca - RA: 2500214
- Giovanna Rodrigues Pereira - RA: 2500628
- Luanne Teles de Oliveira - RA: 2301320

## Funcionalidades previstas
- Cadastro de categorias e produtos
- Controle de estoque por produto, tamanho e cor
- Cadastro de clientes
- Registro de vendas e itens vendidos
- Consulta de vendas por cliente e forma de pagamento

## Modelo de dados
O banco é composto por 8 tabelas:

| Tabela | Função |
|---|---|
| `categorias` | Categorias dos produtos (conjunto, vestido, calça...) |
| `produtos` | Produtos com preço de custo e preço de venda |
| `tamanhos` | Tamanhos disponíveis (PP a GG e numeração 34 a 40) |
| `cores` | Cores disponíveis |
| `estoque` | Quantidade por produto, tamanho e cor |
| `clientes` | Dados dos clientes |
| `vendas` | Cabeçalho de cada venda |
| `itens_venda` | Produtos de cada venda |

## Tecnologias
- Banco de dados: MySQL
- Controle de versão: Git e GitHub

## Estrutura de diretórios
- `conf/mysql/` — script SQL do banco de dados (`script.sql`)
- `conf/tomcat/` — configuração do Tomcat (`app.xml`)

## Como executar
1. Clonar o repositório:
```bash
   git clone https://github.com/luanneoliveira-rgb/SaaS_Infrastructure.git
```
2. Executar o script no MySQL:
```bash
   mysql -u root -p < conf/mysql/script.sql
```