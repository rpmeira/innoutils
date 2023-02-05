test_that("A tabela final tem 3 colunas, chamadas de 'etiqueta', 'cod', 'labels'", {
  planilha <- system.file("extdata", "planilha_etiquetas.xlsx", package = "innoutils")
  df_etiquetas <- xl_etiquetas(arquivo = planilha)

  expect_equal(ncol(df_etiquetas), 3)
  expect_equal(colnames(df_etiquetas), c("etiqueta", "cod", "labels"))
})

test_that("Se a planilha não possui coluna com labels, a tabela cria uma coluna de labels preenchida com '--SEM LABEL--'", {
  planilha <- system.file("extdata", "planilha_etiquetas_semlabels.xlsx", package = "innoutils")
  df_etiquetas <- xl_etiquetas(arquivo = planilha)

  expect_equal(colnames(df_etiquetas), c("etiqueta", "cod", "labels"))
  expect_equal(unique(df_etiquetas$labels), "--SEM LABEL--")
})
