res <- read.csv("coicop/nama_10_co3_p3_1_Data.csv")

coicop_2017 <- res %>% dplyr::filter(UNIT == "Current prices, million euro") %>% 
  dplyr::filter(TIME == 2017) %>% dplyr::select(-UNIT) %>% 
  dplyr::select(-GEO) %>% dplyr::select(-Flag.and.Footnotes) %>% 
  dplyr::filter(!is.na(Value)) %>% dplyr::select(-TIME) %>% 
  dplyr::filter(Value != ":")

coicop_2017_sundb2 <- coicop_2017[-1, ] %>% dplyr::filter(nchar(as.character(COICOP)) == 5) %>% 
  dplyr::mutate(COICOP_LABEL = gsub("-", " ", COICOP_LABEL)) %>% 
  dplyr::mutate(str = paste0(substr(COICOP, 1, 4), "-", COICOP_LABEL)) %>%
  dplyr::mutate(Value = Value %>% as.character() %>% gsub(",", "", .) %>% 
                  as.numeric()) %>% 
  dplyr::select(V1 = str, V2 = Value) 
