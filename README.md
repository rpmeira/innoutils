
<!-- README.md is generated from README.Rmd. Please edit that file -->

# innoutils

<!-- badges: start -->
<!-- badges: end -->

Esse pacotes é composto por diversas funções que visam facilitar algumas
tarefas envolvidas no processamento de dados na Innovare.

## Installation

Você pode instalar a versão em desenvolvimento do `innoutils` direto do
github com:

``` r
# install.packages("devtools")
devtools::install_github("rpmeira/innoutils")
```

## Exemplos

Como utilizar a função `xl_etiquetas` para extrair a relação de códigos
e labels de uma planilha de excel (que utilize etiquetas)

``` r
library(innoutils)

# Exemplo quando há uma coluna com os códiigos e uma coluna com os labels
planilha <- system.file("extdata", "planilha_etiquetas.xlsx", package = "innoutils")
xl_etiquetas(arquivo = planilha)
#> # A tibble: 314 × 3
#>    etiqueta   cod labels                   
#>    <chr>    <dbl> <chr>                    
#>  1 Esca000      1 Índices                  
#>  2 Esca000      2 Outras respostas         
#>  3 Esca103      1 Discorda                 
#>  4 Esca103      2 Nem concorda nem discorda
#>  5 Esca103      3 Concorda                 
#>  6 Esca103      4 NS/NR                    
#>  7 Esca104      1 Discorda                 
#>  8 Esca104      2 Nem concorda nem discorda
#>  9 Esca104      3 Concorda                 
#> 10 Esca104      4 Concorda totalmente      
#> # … with 304 more rows

# Exemplo quando há apenas  a coluna com os códigos (as etiquetas sempre ficam nessa mesma coluna, em cima dos seus respectivos cógios)
planilha_sl <- system.file("extdata", "planilha_etiquetas_semlabels.xlsx", package = "innoutils")
xl_etiquetas(arquivo = planilha_sl)
#> # A tibble: 314 × 3
#>    etiqueta   cod labels       
#>    <chr>    <dbl> <chr>        
#>  1 Esca000      1 --SEM LABEL--
#>  2 Esca000      2 --SEM LABEL--
#>  3 Esca103      1 --SEM LABEL--
#>  4 Esca103      2 --SEM LABEL--
#>  5 Esca103      3 --SEM LABEL--
#>  6 Esca103      4 --SEM LABEL--
#>  7 Esca104      1 --SEM LABEL--
#>  8 Esca104      2 --SEM LABEL--
#>  9 Esca104      3 --SEM LABEL--
#> 10 Esca104      4 --SEM LABEL--
#> # … with 304 more rows
```
