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

## Procedimento de Adição

Ao clicar no botão da tela manter no canto superior direito, o modal com diferentes abas é aberto. O botão "Salvar" irá carregar os dados de __todas__ as abas simultaneamente. O processo de geração de registro é o seguinte:

1. É gerado um novo registro em FFVU_FATR_SERV que aponta para o campo FFVU_MODL_FATR que possui DE_TIPO_FATR igual a "BASICA" e que aponta para FFVU_TIPO_SERV com DE_TIPO_SERV igual a "ENERGIA".

2. A data de início no campo período corresponde ao campo DT_INIC da tabela FFVU_FATR_SERV e a data final (à direita) no campo período corresponde ao campo DT_TERM da tabela FFVU_FATR_SERV

3. __Cada__ caixa de texto presente nas abas "Consumo", "Demanda" e "Encargos" gerará um novo registro em FFVU_LANC. Cada caixa terá um tipo de lançamento, expresso em FFVU_TIPO_LANC diferente segundo a tabela abaixo, que especifica as relações para as abas "Consumo" e "Demanda"

| Aba | Input Box | Valor de FFVU_TIPO_LANC.DE_TIPO_LANC |
| --- | --- | --- |
| Consumo | Valor Ponta | "CONSUMO_P" |
| Consumo | Valor Fora Ponta | "CONSUMO_FP" |
| Consumo | Tarifa Ponta | "CONSUMO_TP" |
| Consumo | Tarifa Fora Ponta | "CONSUMO_TARIFA_FP" |
| Demanda | Ponta | "DEMANDA_P" |
| Demanda | Fora Ponta | "DEMANDA_FP" |
| Demanda | Contratada | "DEMANDA_CONTRATADA" |
| Demanda | Tarifa | "DEMANDA_TARIFA" |

4. Para a aba "Encargos", teremos uma tabela dinâmica. O usuário poderá escolher no ComboBox realizar o acréscimo de diferentes encargos. Esses encargos correspondem aos valores de DE_TIPO_LANC na tabela FFVU_TIPO_LANC para os quais FFVU_TIPO_LANC.LG_ENCG é igual a "S". Assim, para cada valor escolhido, acrescenta-se de forma similar ao especificado acima com FFVU_TIPO_LANC correspondendo à opção selecionada no ComboBox.

Finalmente, ao clicar em salvar, o conjunto de dados é carregado no banco __simultaneamente__. Cria-se então 1 registro novo em FFVU_FATR e 8 + (Quantidade de Encargos) registros novos em FFVU_LANC (cada valor respecivo sendo inputado em FFVU_LANC.VL_LANC e cada tipo correspondente no registro é relacionado à linha correspondente de FFVU_TIPO_LANC)

## Procedimento de Edição

O processo de edição é similar. Precisamos buscar o registro da fatura correspondente à linha e o registro de FFVU_LANC correspondente ao valor que está sendo editado. Existe apenas uma diferente: ao invés de termos abas, o usuário clica diretamente no valor da tabela.

## Procedimento de Exclusão de Fatura

Corresponde a alterar FFVU_FATR_SERV de LF_ATIV igual a "S" para LG_ATIV igual a "N"
