# Tabelas do Módulo de Fatura

## Tabela FFVU_LANC

__Descrição__: Tabela com valor de lançamentos que constam nas diferentes faturas geridas pelo sistema

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_LANC | NUMERIC(8) | PK incrementada com sequence FFSQ201 | Chave artificial |
| CD_FATR_SERV | NUMERIC(8) | FK para a tabela FFVU_FATR_SERV | Determina à qual fatura o lançamento se refere |
| CD_TIPO_LANC | NUMERIC(8) | FK para a tabela FFVU_TIPO_LANC | Determina o tipo de lançamento, ou seja, o tipo de campo da respectiva fatura ao qual se refere o lançamento |
| VL_LANC | NMERIC(10, 2) | Descreve o valor monetário do lançamento |

## Tabela FFVU_FATR_SERV

__Descrição__: Tabela com conjunto de faturas gerenciadas pelo sistema

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- |
| CD_FATR_SERV | NUMERIC(8) | PK incrementada com sequence FFSQ200 | Chave artificial |
| CD_MODL_FATR | NUMERIC(8) | FK para a tabela FFVU_MODL_FATR | Modalidade (conjunto de campos) presente na fatura |
| DT_INIC | DATE | Deve ser menor que DT_FIM  | Data de início da cobrança da fatura |
| DT_FIM | DATE | Deve ser maior que DT_INIC | Data fim da cobrança da fatura |

## Tabela FFVU_TIPO_LANC
