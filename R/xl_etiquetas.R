#' Tabela de etiquetas de excel
#' @importFrom magrittr %>%
#'
#' @param arquivo O caminho para uma planilha de excel contendo etiquetas
#'
#' @description
#' Cria uma tabela (tibble) a partir das etiquetas contidas em um arquivo de excel.
#' Para planilhas de labels da Innovare no formato "Var/Val", acessa a aba "Val" e coloca as etiquetas na primeira coluna, os códgios na segunda coluna e os labels na terceira coluna
#'
#' @return Uma tabela (tibble)
#' @export
#'
#' @examples
#' planilha <- system.file("extdata", "planilha_etiquetas.xlsx", package = "innoutils")
#' xl_etiquetas(arquivo = planilha)
#'
#' planilha_sl <- system.file("extdata", "planilha_etiquetas_semlabels.xlsx", package = "innoutils")
#' xl_etiquetas(arquivo = planilha_sl)
xl_etiquetas <- function(arquivo) {

  etiquetas <- openxlsx::getNamedRegions(x = arquivo) %>% stringr::str_subset("_", negate = T)

  etiq_labels <- vector(mode = "list", length = length(etiquetas))
  for (i in seq_along(etiq_labels)) {
    etiq_labels[[i]] <- openxlsx::read.xlsx(xlsxFile = arquivo, namedRegion = etiquetas[i], colNames = F) %>%
      tibble::tibble()

      if (ncol(etiq_labels[[i]]) == 1) {
        etiq_labels[[i]] <- tibble::tibble(etiq_labels[[i]]) %>% tibble::add_column("X2" = "--SEM LABEL--")
      } else {
        etiq_labels[[i]] <- tibble::tibble(etiq_labels[[i]])
      }

    etiq_labels[[i]] <- etiq_labels[[i]] %>%
      dplyr::rename("cod" = 1, "labels" = 2) %>%
      dplyr::mutate("etiqueta" = etiquetas[i], .before = 1) %>%
      dplyr::select(1:3)
  }
  etiq_df <- dplyr::bind_rows(etiq_labels)

  return(etiq_df)
}
