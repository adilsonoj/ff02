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

## Tabela FFVU_TIPO_LANC

__Descrição__: Os tipos de campos de uma fatura são descritos por diferentes lançamentos

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_TIPO_LANC | NUMERIC(8) | PK incrementada com sequence FFSQ205 | Chave artificial |
| DE_TIPO_LANC | VARCHAR(20) | | Descrição do tipo de lançamento (campo da fatura) |

## Tabela FFVU_MODL_FATR

__Descrição__: As modalidades de fatura, representadas por esta entidade, correspondem aos diferentes tipos de conjuntos de campos que uma fatura pode apresentar. Uma fatura de energia elétrica, por exemplo, pode apresentar diferentes conjuntos de campos em sua fatura a depender do tipo de tarifa. Os diferentes conjuntos que podem ocorrer para esse tipo de serviço (serviço de energia) é representado pela modalidade de fatura.

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_MODL_FATR | NUMERIC(8) | PK incrementada com sequence FFSQ203 | Chave artificial |
| CD_TIPO_SERV | NUMERIC(8) | FK para a tabela FFVU_TIPO_SERV | Se refere ao tipo de serviço (água, energia etc.) ao qual a modalidade tarifária se refere (ver descrição acima) |
| DE_TIPO_FATR | VARCHAR(20) | | Descrição do tipo de fatura |
