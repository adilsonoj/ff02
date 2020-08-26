# Tabelas do Módulo de Fatura

## Tabela FFVU_LANC

__Descrição__: Tabela com valor de lançamentos que constam nas diferentes faturas geridas pelo sistema

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_LANC | NUMERIC(8) | PK incrementada com sequence FFSQ201 | Chave artificial |
| CD_FATR_SERV | NUMERIC(8) | FK para a tabela FFVU_FATR_SERV | Determina à qual fatura o lançamento se refere |
| CD_TIPO_LANC | NUMERIC(8) | FK para a tabela FFVU_TIPO_LANC | Determina o tipo de lançamento, ou seja, o tipo de campo da respectiva fatura ao qual se refere o lançamento |
| VL_LANC | NUMERIC(10, 2) | | Descreve o valor monetário do lançamento |

## Tabela FFVU_FATR_SERV

__Descrição__: Tabela com conjunto de faturas gerenciadas pelo sistema

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_FATR_SERV | NUMERIC(8) | PK incrementada com sequence FFSQ200 | Chave artificial |
| CD_MODL_FATR | NUMERIC(8) | FK para a tabela FFVU_MODL_FATR | Modalidade (conjunto de campos) presente na fatura |
| DT_INIC | DATE | Deve ser menor que DT_FIM  | Data de início da cobrança da fatura |
| DT_FIM | DATE | Deve ser maior que DT_INIC | Data fim da cobrança da fatura |
| LG_ATIV | CHAR(1) | "S" ou "N" | Determina se o registro se encontra ativo |

## Tabela FFVU_MODL_FATR

__Descrição__: As modalidades de fatura, representadas por esta entidade, correspondem aos diferentes tipos de conjuntos de campos que uma fatura pode apresentar. Uma fatura de energia elétrica, por exemplo, pode apresentar diferentes conjuntos de campos em sua fatura a depender do tipo de tarifa. Os diferentes conjuntos que podem ocorrer para esse tipo de serviço (serviço de energia) é representado pela modalidade de fatura.

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_MODL_FATR | NUMERIC(8) | PK incrementada com sequence FFSQ203 | Chave artificial |
| CD_TIPO_SERV | NUMERIC(8) | FK para a tabela FFVU_TIPO_SERV | Se refere ao tipo de serviço (água, energia etc.) ao qual a modalidade tarifária se refere (ver descrição acima) |
| DE_TIPO_FATR | VARCHAR(20) | | Descrição do tipo de fatura |

## Tabela FFVU_TIPO_SERV

__Descrição__: Descreve se a fatura em questão (ou o tipo de consumo em questão) é de água, energia etc.

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_TIPO_SERV | NUMERIC(8) | PK incrementada com sequence FFSQ206 | Chave artificial |
| DE_TIPO_SERV | VARCHAR2(20) | | Descrição do tipo de serviço |

## Tabela FFVU_TIPO_LANC

__Descrição__: Os tipos de campos de uma fatura são descritos por diferentes lançamentos

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_TIPO_LANC | NUMERIC(8) | PK incrementada com sequence FFSQ205 | Chave artificial |
| DE_TIPO_LANC | VARCHAR(20) | | Descrição do tipo de lançamento (campo da fatura) |

# Tabelas do Módulo de Consumo

## Tabela FFVU_TIPO_CONS

__Descrição__: Determina se o consumo medido é de demanda ponta, demanda fora ponta, vazão de água etc. Notar que cada tipo de consumo se associa a um determinado tipo deserviço (energia, água...)

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_TIPO_CONS | NUMERIC(8) | PK incrementada com sequence FFSQ204 | Chave artificial |
| CD_TIPO_SERV | NUMERIC(8) | FK para a tabela FFVU_MDDA_CONS | Determina o serviço referente ao tipo de medição |
| DE_TIPO_CONS | VARCHAR(20) | | Descreve o tipo de consumo em questão |

## FFVU_MDDA_CONS

__Descrição__: Determina o valor da medida realizada, para se auferir o consumo e se efetuar o rateio entre diferentes Unidades de Consumo (que podem pertencer a diferentes OM's)

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_MDDA_CONS | NUMERIC(8) | PK implementada com sequence FFSQ202 | Chave  |
| CD_UNID_CONS | NUMERIC(8) | FK para tabela FFVU_CLIE | |
| CD_TIPO_CONS | NUMERIC(8) | | |
| VL_MDDA_CONS | NUMERIC(10, 2) | | Valor da medida do consumo |
| DT_MDDA_CONS | DATE | | Data na qual o consumo foi levantado |

## FFVU_UNID_CONS

__Descrição__: Entidade que representa os diferentes centros de consumo presentes na CNIC. Exemplos: "Edifício 1 do CMS, "Edifício 2 do CMS", "Edifício 11 do AMRJ"etc.

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_UNID_CONS | NUMERIC(8) | PK implementada com sequence FFSQ208 | |
| ID_CLIE_CAP | CHAR(5) | FK para tabela FFVU_CLIE | Determina OM responsável pela Unidade de Consumo |
| CD_TIPO_UNID_CONS | NUMERIC(8) | FK para tabela FFVU_TIPO_UNID_CONS | Determina a classificação da Unidade de Consumo (navio, OM de terra etc.) |
| DE_UNID_CONS | VARCHAR2(20) | | Descrição da unidade de consumo |
| LG_ATIV | CHAR(1) | "S" ou "N" | Determina se o registro se encontra ativo |

## FFVU_TIPO_UNID_CONS

__Descrição:__ Tabela de domínio relativa ao tipo de Unidade de Consumo (O.M de terra, navio etc.)

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_TIPO_UNID_CONS | NUMERIC(8) | PK implementada com sequence FFSQ207 | Chave artificial |
| DE_TIPO_UNID_CONS | VARCHAR2(20) | | Descrição do tipo de unidade de consumo | 

# Tabela Externa do Sistema EE01

## Tabela FFVU_CLIE

__Descrição__: Lista os diferentes "clientes" (OM's) presentes no CNIC

- Checar especificação do respectivo sistema para descrições mais detalhadas

