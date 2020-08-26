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

## Modal

### Modal de Adição 

O modal de adição consistirá em um conjunto de abas e, em cada uma delas, diferentes tipos de parâmetros serão inseridos.

### Modais de Edição / Visualização

Os modais de edição / visualização estarão "espalhados" ao longo da tabela em diferentes hiperlinks. Cada hiperlink corresponde a uma aba do modal de adição especificado acima.

* Caso o usuário clique em "Mês / Ano", o modal correspondente à aba "Mês / Ano" de adição será aberto.
* Caso o usuário clique em "Consumo", o modal correspondente à aba "Consumo" de adição será aberto.
* Caso o usuário clique em "Consumo", o modal correspondente à aba "Consumo" de adição será aberto.
* Caso o usuário clique em "Encargos", o modal correspondente à aba "Encargos" de adição será aberto.

Tais modais serão pré-carregados com os valores da linha correspondente e serão editáveis. Não haverá modal específico de visualização: pressupomos que o usuário irá simplesmente abrir o modal de edição sem editar os valores. Isso simplifica o layout da tela, que tende a tomar um aspecto carregado caso o projeto não busque o máximo de simplificações.

## Ações no Banco de Dados

### Adicionar Registro

O modal de adição de registros especificado na seção anterior irá inserir as informações relativas à fatura no Banco de Dados. A correlação entre cada um dos campos preenchidos será especificado sequencialmente na tabela abaixo:

---

#### A. Inserir fatura com o mês e ano preenchidos

O valor de DT_INIC_DATE será igual à data de início escrita na primeira aba do modal e o valor de DT_FIM_DATE será igual à data final escrita nessa mesma aba.

Caso a data final seja maior ou igual que a data inicial, a seguinte mensagem de erro deverá ser lançada em janela Sweet Alert:

> A data final deve ocorrer após a data inicial

O registro criado deverá ter CD_MODL_FATR apontando para o registro de FFVU_MODL_FATR para o qual DE_TIPO_FATR seja igual a "BASICA" - Caso esse registro não exista, o programa deverá criá-lo.

O registro para o qual DE_TIPO_FATR é igual a "BASICA" deverá ter o campo CD_TIPO_SERV apontando para o registro de FFVU_TIPO_SERV para o qual DE_CLAS_FATR é igual a "ENERGIA. Se esse registor não existir, o programa deverá criá-lo.

Se algum dos campos aqui descritos se encontrar vazio e o usuário pressionar "Salvar", a mensagem "Todos os campos devem ser preenchidos" em janela Sweet Alert deverá ser lançada.

A criação de uma nova fatura irá se dar com a mesma "ativa", ou seja,com FFVU_FATR.LG_ATIV igual a "S".

---

#### B. Inserir parâmetros de "CONSUMO PONTA", "DEMANDA PONTA", "CONSUMO FORA PONTA", "DEMANDA FORA PONTA", "TARIFA CONSUMO PONTA", "TARIFA CONSUMO FORA PONTA", "DEMANDA CONTRATADA" e "VALOR_TOTAL"

É preciso verificar qual é o registro de FFVU_MODL_FATR para o qual CD_TIPO_SERV faz referência ao registro da tabela FFVU_TIPO_SERV com valor DE_CLAS_FATR igual a "ENERGIA" e para o qual DE_TIPO_FATR é igual a "BASICA".

Para esse registro, precisamos verificar há registros em FFVU_TIPO_LANC a ele ligados (pela FK CD_MODL_FATR) para os quais DE_TIPO_LANC assume os seguintes valores:

* "CONSUMO PONTA"
* "DEMANDA PONTA"
* "CONSUMO FORA PONTA"
* "DEMANDA FORA PONTA"
* "TARIFA CONSUMO PONTA"
* "TARIFA DEMANDA PONTA"
* "TARIFA CONSUMO FORA PONTA"
* "TARIFA DEMANDA FORA PONTA"
* "VALOR TOTAL" e
* "DEMANDA CONTRATADA"

Caso alguns desses registros não estejam presentes, eles devem ser criados. Em seguida, precisamos gerar 10 registros em FFVU_LANC (um para cada um dos registros acima elencados) e esses registros devem possuir CD_FATR fazendo referência para a fatura gerada e CD_TIPO_LANC para cada um dos tipos de lançamento listados acima:

* Para o registro de FFVU_TIPO_LANC com DE_TIPO_LANC igual a cada um dos strings pontuados acima, o registro adicionado deve possuir VL_LANC igual ao valor correspondente lançado no modal (Consumo na Ponta, Consumo Fora de Ponta etc.)

#### C. Inserir parâmetros de encargos a serem pagos

Os encargos serão inseridos em um modal no qual é possível que o usuário possa digitar ou selecionar possibilidades já preenchidas. Essas possibilidades correspondem à listagem dos valores de FFVU_TIPO_LANC.DE_TIPO_LANC relacionados à modalidade FFVU_MODL_FATR com DE_TIPO_FATR igual a "BASICA" e com CD_TIPO_SERV tal que FFVU_TIPO_SERV.DE_CLAS_FATR é igual a "ENERGIA" para as quais LG_CONS é igual a "N".

Caso o usuário digite um valor que não se encontra presente na listagem citada no parágrafo anterior, uma janela de alerta perguntando: "Tributo não encontrado. Deseja adicioná-lo à lista de tributos?" deverá ser aberta. Em caso afirmativo, o registro correspondente será adicionado em FFVU_TIPO_LANC mantendo-se o relacionamento com o registro de FFVU_MODL_FATR mencionado também no parágrafo anterior. A digitação do tributo deverá aplicar uma máscara que apenas permite que caracteres maiúsculos sejam escritos.

O valor assumido por esse tributo para a fatura a ser acrescentada em FFVU_FATR corresponderá a um registro em FFVU_LANC com valor VL_LANC igual ao valor em reais digitado pelo usuário e, no campo de digitação, uma máscara para valores financeiros deverá ser programada.

### Editar Registro

A abertura dos modais de edição pré-carregará o modal de registro com os valores inseridos.

A edição do registro deverá alterar o valor de FFVU_LANC.VL_LANC referenciado na seção acima para cada um dos campos correspondentes criados.

###  Remover Registro

A inativação do registro ocorrerá quando o usuário clicar em botão de exclusão correspondente à fatura que se quer excluir. Existirá um botão de exclusão para cada mês e ano exibidos na tabela. Não haverá remoção e sim alteração de FFVU_FATR.LG_ATIV de "S" para "N".
