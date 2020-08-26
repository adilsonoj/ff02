# Especificação - TfrmUC

## Descrição

A tela principal possui a estrutura:

__Tela Principal__: Os botões azul (adição), verde (visualização) e amarelo (edição) abrem o modal com a seguinte estrutura:

![Unidades%20de%20Consumo.png](Unidades%20de%20Consumo.png)

__Modal Auxiliar__: Assim, a tela possui uma única tabela: a tabela da tela principal (chamaremos de TABELA_TELA_PRINCIPAL). A relação dos campos da tabela com o banco de dados para cada um dos casos é especificado na seção a seguir, bem como o procedimento de adição de novos campos ou edição de campos existentes.

![Modal%20-%20Unidades%20de%20Consumo.png](Modal%20-%20Unidades%20de%20Consumo.png)

## Tabelas

### TABELA_TELA_PRINCIPAL

| Campo | Tipo | Domínio | Fonte de Dados | Obs. |
| --- | --- | --- | --- | --- | 
| Tipo | String | "Navio" / "Submarino" / "OM Terra" | FFVU_TIPO_UNID_CONS.DE_TIPO_UNID_CONS WHERE FFVU_TIPO_UNID_CONS.CD_TIPO_UNID_CONS = FFVU_UNID_CONS | NA |
| Descrição | String | Livre | FFVU_UNID_CONS.DE_UNID_CONS | NA |
| Cliente | String | Livre | FFVU_CLIE_CAP.DE_CLIE_CAP WHERE FFVU_CLIE_CAP.ID_CLIE_CAP = FFVU_TIPO_UNID_CONS.ID_CLIE_CAP | NA |

### TABELA_MODAL

Esse modal possui três campos:

1. O Tipo de UC (ComboBox), que poderá ser "Navio", "Submarino" ou "OM. de Terra".
2. A Descrição (Input de Texto) da UC a ser adicionada, que será uma string de até 20 caracteres.
3. O Cliente (ComboBox) da Unidade de Consumo. As possíveis OM serão carregadas do BD a partir da tabela O.I (FFVU_CLIE_CAP - Listar os diferentes valores possíveis de FFVU_CLIE_CAP.DE_CLIE_CAP)

A adição ou edição de campos ocorrerá com a respectiva adição ou edição de registro segundo a seguinte correlação:

| Campo do Modal | Banco de Dados |
| --- | --- |
| Tipo | FFVU_TIPO_UNID_CONS.DE_UNID_CONS WHERE TIPO_UNID_CONS.CD_TIPO_UNID = FFVU_TIPO_UNID_CONS.CD_TIPO_UNID_CONS |
| Descrição | FFVU_UNID_CONS.DE_UNID_CONS |
| Cliente | Verificar listagem de O.I em TabelaOIdoAMRJ - FFVU_CLIE_CAP - Listar os diferentes valores possíveis de FFVU_CLIE_CAP.DE_CLIE_CAP | 

No caso da edição, os dados listados na tabela acima deverão ser pré-carregados de acordo com a linha selecionada.

## Operações de Remoção de Campos

O campo não será removido. O seu registro "ativo" (FFVU_UNID_CONS.LG_ATIV) será alterado se "S" para "N" e, nos termos do especificado previamente, isso irá omitir a exibição desse registro na camada de interface do usuário.
