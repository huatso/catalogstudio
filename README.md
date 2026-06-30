# CatalogStudio

Criador de catálogos de produtos em PDF diretamente no navegador. Aplicação React single-page, sem build step -- abre o HTML e funciona.

## Como usar

1. Abra o arquivo `index.html` (ou `app.html`) em qualquer navegador moderno.
2. Nenhum servidor ou instalação necessária. Se preferir, use um servidor HTTP simples:

```bash
python3 -m http.server 3000
```

## Funcionalidades

### Gerenciamento de produtos

- **Adicionar** -- cria um novo produto em branco com formulário expansível.
- **Importar dados** -- aceita arquivos CSV ou Excel (.xlsx / .xls). Mapeamento automático de colunas.
- **Download de modelo** -- botão no modal de importação gera um arquivo Excel com as colunas que você usa.
- **Reordenar** -- botões de mover para cima/baixo.
- **Excluir** -- remove produto da lista.
- **Imagens** -- upload direto no formulário (data URL).

### Campos visíveis (aba Produtos)

Toggles individuais para exibir ou ocultar no catálogo:

- SKU / Código
- Embalagem (PCS)
- Preço
- Descrição
- Link / Botão de acesso

### Personalização visual (aba Aparência)

- **Identidade** -- nome da empresa, título do catálogo, logotipo, rodapé, label do preço.
- **Cores** -- cor primária, cor do texto sobre primária, fundo da página, fundo do card, cor do texto. Arraste horizontalmente no seletor para alterar o matiz (hue) e verticalmente para ajustar a luminosidade. Clique para abrir o seletor nativo de cores e escolher um valor exato.
- **Tipografia** -- seleção de fonte (Inter, Roboto, Poppins, Georgia, Arial) e tamanho base.
- **Cabeçalho** -- estilo completo, mínimo ou nenhum.
- **Cards** -- raio da borda, altura da imagem, bordas.

### Layout (aba Estrutura)

- **Papel** -- A4, A3, Letter.
- **Orientação** -- Retrato ou Paisagem.
- **Grade** -- colunas (1 a 6) e linhas (1 a 8) por página.
- Cálculo automático de produtos por página e total de páginas.

### Preview ao vivo

A pré-visualização renderiza o catálogo em tempo real na área principal com controle de zoom.

### Exportar PDF

Clique em "Exportar PDF" -- o navegador abre a caixa de diálogo de impressão. Selecione "Salvar como PDF" nas opções de destino.

Para melhor resultado:
- Use Chrome.
- Desmarque "Cabeçalhos e rodapés" nas opções de impressão.
- Defina margens como "Mínimas" ou "Nenhuma".

## Importação de dados

### CSV

Colunas reconhecidas (qualquer ordem, case-insensitive):

| Coluna no CSV | Campo do produto |
|---|---|
| `sku`, `codigo`, `code` | SKU / Código |
| `name`, `nome`, `produto` | Nome (obrigatório) |
| `description`, `descricao`, `desc` | Descrição |
| `price`, `preco`, `valor` | Preço |
| `pcs`, `embalagem` | Embalagem |
| `image`, `imagem`, `image_url` | URL da imagem |
| `link`, `url`, `link_url` | URL do link |
| `link_label`, `link_texto` | Texto do botão |

### Excel

Mesmo mapeamento de colunas. Aceita `.xlsx` e `.xls`. Use o botão "Baixar modelo Excel" dentro do modal de importação para obter um arquivo de exemplo com as colunas adequadas ao seu catálogo.

## Stack

- React 18 (via CDN, sem build step)
- Babel Standalone (para JSX no browser)
- SheetJS / xlsx (para leitura e geração de Excel)
- Google Fonts (Inter, Roboto, Poppins)
- Exportação PDF via `window.print()` com `@page` estilizado
- Sem dependências de backend -- tudo no lado do cliente
