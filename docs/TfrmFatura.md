# Especificação - TfrmFatura

## Descrição

A tela de fatura possui o seguinte layout:

![Fatura%20Agregada.png](Fatura%20Agregada.png)

Em tal tela, é possível chamar modais de adição, edição e inativação dos campos (não se trata de uma remoção, pois os dados são inativados mas permanecem no Banco de Dados). Tais modais possuem diversas abas, cada uma relativa a um tipo diferente de dados. Iremos nos referir a tais abas por __ABA_1__, __ABA_2__, __ABA_3__ e __ABA_4__ e eles são demonstrados, respectivamente, abaixo:

* __ABA_1__:

![Modal%20Fatura%20Agregada%20-%20Parte%201.png](Modal%20Fatura%20Agregada%20-%20Parte%201.png)

* __ABA_2__:

![Modal%20Fatura%20Agregada%20-%20Parte%202.png](Modal%20Fatura%20Agregada%20-%20Parte%202.png)

* __ABA_3__:

![Modal%20Fatura%20Agregada%20-%20Parte%203.png](Modal%20Fatura%20Agregada%20-%20Parte%203.png)

* __ABA_4__:

![Modal%20Fatura%20Agregada%20-%20Parte%204.png](Modal%20Fatura%20Agregada%20-%20Parte%204.png)

## Relação Entre Campos e Conteúdo da Tabela Manter

Para cada valor de Mês e Ano (período da fatura), teremos duas linhas em determinadas colunas e uma única linha para as colunas Encargos e Total. Assim, iremos especificar abaixo a relação entre campos e conteúdo dizendo a linha (primeira ou segunda para aquela data de fatura - ou, ainda, "linha única") e a coluna na qual a célula do dado correspondente se encontra.

| Coluna | Linha | Campo | Obs |
| --- | --- | --- | --- |
| Mês / Ano | Linha única | FFVU_FATR_SERV.DT_INIC_DATE | Formato "MM/AAAA" |
| Gestão | Linha 1 | NA | Valor constante, igual à string "Consumo" |
| Demanda | Linha 2 | NA | Valor constante, igual à string "Demanda" |
| Energia / Ponta | Linha 1 | FFVU_LANC.VL_LANC | FFVU_TIPO_LANC.DE_TIPO_LANC = "CONSUMO_PONTA" |
| Energia / Fora Ponta | Linha 2 | FFVU_LANC.VL_LANC | FFVU_TIPO_LANC.DE_TIPO_LANC = "DEMANDA_PONTA" |
| Tarifa / Ponta | Linha 1 | FFVU_LANC.VL_LANC | FFVU_TIPO_LANC.DE_TIPO_LANC = "TARIFA_CONSUMO_PONTA" |
| Tarifa / Fora Ponta | Linha 2 | FFVU_LANC.VL_LANC | FFVU_TIPO_LANC.DE_TIPO_LANC = "TARIFA_DEMANDA_PONTA" |
| Encargos | Linha única | FFVU_LANC.VL_LANC | Somar todas os valores para os quais FFVU_TIPO_LANC.DE_TIPO_LANC se inicia com a string "ENCARGO_" |
| Total | Linha única | FFVU_LANC.VL_LANC | Somar todos os valores provenientes de FFVU_LANC.VL_LANC obtidos nas linhas anteriores |
