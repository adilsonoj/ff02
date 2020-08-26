# Tabelas do Módulo de Fatura

## Tabela FFVU_LANC

__Descrição__: Tabela com valor de lançamentos que constam nas diferentes faturas geridas pelo sistema

| Campo | Tipo | Restrição de Domínio | Descrição |
| --- | --- | --- | --- | --- |
| CD_LANC | NUMERIC(8) | PK incrementada com sequence FFSQ201 | Chave artificial |
| CD_FATR_SERV | NUMERIC(8) | FK para a taela FFVU_FATR_SERV | Determina à qual fatura o lançamento se refere |


# Tabelas do Módulo de Consumo
