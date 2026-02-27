library(pxweb)
library(dplyr)
library(tidyr)
library(janitor)
library(renv)

pxweb_query_list <-
  list("Tilaston peruskuolemansyy (aikasarjaluokitus)"=c("SSS", "50","51"),
       "Ikä"=c("15-19","20-24","25-29"),
       "Sukupuoli"=c("SSS","1","2"),
       "Vuosi"=as.character(1969:2024),
       "Tiedot"=c("ksyylkm"))

px_data <-
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/ksyyt/statfin_ksyyt_pxt_11az.px",
            query = pxweb_query_list)

statfin_ksyyt_pxt_11az <- as.data.frame(px_data,
                                        column.name.type = "text",
                                        variable.value.type = "text")

statfin_ksyyt_pxt_11az <- statfin_ksyyt_pxt_11az %>%
  janitor::clean_names()

pxweb_query_list <-
  list("Tilaston peruskuolemansyy (ICD-10, 3-merkkitaso)"=c("F11","F12", "F14",
                                                            "F15", "F16", "F19",
                                                            "X41", "X42", "X44",
                                                            "X61", "X62", "X64",
                                                            "Y11", "Y12", "Y14"),
       "Ikä"=c("15-19","20-24","25-29"),
       "Sukupuoli"=c("SSS","1","2"),
       "Vuosi"=as.character(1998:2024),
       "Tiedot"=c("ksyylkm"))

# Huumausainekuolemat ICD-10 -koodeilla, ilman itsemurhia
pxweb_query_list <-
  list("Tilaston peruskuolemansyy (ICD-10, 3-merkkitaso)"=c("F11","F12", "F14",
                                                            "F15", "F16", "F19",
                                                            "X41", "X42", "X44",
                                                            "Y11", "Y12", "Y14"),
       "Ikä"=c("15-19","20-24","25-29"),
       "Sukupuoli"=c("SSS","1","2"),
       "Vuosi"=as.character(1998:2024),
       "Tiedot"=c("ksyylkm"))

px_data <-
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/ksyyt/statfin_ksyyt_pxt_11be.px",
            query = pxweb_query_list)

statfin_ksyyt_pxt_11be <- as.data.frame(px_data,
                                        column.name.type = "text",
                                        variable.value.type = "text")

statfin_ksyyt_pxt_11be <- statfin_ksyyt_pxt_11be %>%
  janitor::clean_names()

pxweb_query_list <-
  list("Huume (B-luokitus)"=c("SSS"),
       "Ikä"=c("15-19","20-24","25-29"),
       "Sukupuoli"=c("SSS","1","2"),
       "Vuosi"=as.character(2006:2024),
       "Tiedot"=c("ksyylkm15"))

px_data <-
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/ksyyt/statfin_ksyyt_pxt_12d9.px",
            query = pxweb_query_list)

statfin_ksyyt_pxt_12d9 <- as.data.frame(px_data,
                                        column.name.type = "text",
                                        variable.value.type = "text")

statfin_ksyyt_pxt_12d9 <- statfin_ksyyt_pxt_12d9 %>%
  janitor::clean_names()


# PXWEB query: Huumausainekuolemat ICD-10 -koodeilla, ilman itsemurhia
pxweb_query_list <-
  list("Tilaston peruskuolemansyy (ICD-10, 3-merkkitaso)"=c("F11","F12", "F14",
                                                            "F15", "F16", "F19",
                                                            "X41", "X42", "X44",
                                                            "Y11", "Y12", "Y14"),
       "Ikä"=c("15-19","20-24","25-29"),
       "Sukupuoli"=c("SSS","1","2"),
       "Vuosi"=as.character(1998:2024),
       "Tiedot"=c("ksyylkm"))

# PXWEB query
pxweb_query_list <-
  list("Tilaston peruskuolemansyy (ICD-10, 3-merkkitaso)"=c("F11","F12", "F14",
                                                            "F15", "F16", "F19",
                                                            "X41", "X42", "X44",
                                                            "X61", "X62", "X64",
                                                            "Y11", "Y12", "Y14"),
       "Ikä"=c("15-19","20-24","25-29"),
       "Sukupuoli"=c("SSS","1","2"),
       "Vuosi"=as.character(1998:2024),
       "Tiedot"=c("ksyylkm"))

# Download data
px_data <-
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/ksyyt/statfin_ksyyt_pxt_11be.px",
            query = pxweb_query_list)

# Convert to data.frame, clean names and do summarizing
statfin_ksyyt_pxt_11be_summarized <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text") %>%
  janitor::clean_names() %>%
  tidyr::drop_na() %>%
  group_by(ika, vuosi, sukupuoli) %>%
  summarize(n_huumekuolema = sum(kuolleet)) %>%
  ungroup()


# Keskiväkiluvun laskeminen

# PXWEB query
pxweb_query_list <-
  list("Vuosi"=as.character(1865:2024),
       "Sukupuoli"=c("SSS"),
       "Ikä"=c("15-19", "20-24", "25-29"),
       "Tiedot"=c("vaesto"))

# Download data
px_data <-
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/vaerak/statfin_vaerak_pxt_11rc.px",
            query = pxweb_query_list)

# Convert to data.frame
statfin_vaerak_pxt_11rc <- as.data.frame(px_data,
                                         column.name.type = "text",
                                         variable.value.type = "text")

statfin_vaerak_pxt_11rc <- statfin_vaerak_pxt_11rc %>%
  janitor::clean_names()

itse_laskettu_keskivakiluku <- statfin_vaerak_pxt_11rc %>%
  group_by(vuosi) %>%
  summarize(vakiluku_15_29 = sum(vaesto_31_12)) %>%
  mutate(keskivakiluku = (vakiluku_15_29 + lag(vakiluku_15_29)) / 2) %>%
  ungroup()


pxweb_query_list <-
  list("Huume (B-luokitus)"=c("01-06","07-17","29-39"),
       "Ikä"=c("15-19","20-24","25-29"),
       "Vuosi"=c("2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024"),
       "Sukupuoli"=c("SSS", "1", "2"),
       "Tiedot"=c("ksyylkm15"))

# Download data
px_data <-
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/ksyyt/statfin_ksyyt_pxt_12d9.px",
            query = pxweb_query_list)

# Convert to data.frame
px_data_frame <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text") %>%
  janitor::clean_names()

statfin_ksyyt_pxt_12d9_ilman_itsemurhia <- px_data_frame %>%
  group_by(ika, sukupuoli, vuosi) %>%
  summarize(kuolleet_06_24 = sum(huumeisiin_kuolleet_b_luokitus, na.rm = TRUE)) %>%
  mutate(kuolemansyy = "huumekuolema")

itsemurhat_vakivalta <- statfin_ksyyt_pxt_11az %>%
  # filter(sukupuoli %in% c("Miehet", "Naiset"), as.numeric(vuosi) >= 2006) %>%
  # filter(!(tilaston_peruskuolemansyy_aikasarjaluokitus %in% "00-54 Yhteensä")) %>%
  group_by(tilaston_peruskuolemansyy_aikasarjaluokitus, vuosi, ika, sukupuoli) %>%
  summarize(kuolleet_06_24 = sum(kuolleet)) %>%
  mutate(kuolemansyy = case_when(
    tilaston_peruskuolemansyy_aikasarjaluokitus == "50 Itsemurhat (X60-X84, Y870)" ~ "itsemurha",
    tilaston_peruskuolemansyy_aikasarjaluokitus == "51 Murha, tappo tai muu tahallinen pahoinpitely (X85-Y09, Y871)" ~ "vakivalta",
    .default = "muut"
  )) %>%
  ungroup() %>%
  select(vuosi, ika, sukupuoli, kuolleet_06_24, kuolemansyy)

statfin_ksyyt_pxt_12d9 <- statfin_ksyyt_pxt_12d9 %>%
  janitor::clean_names()

huumekuolemat <- statfin_ksyyt_pxt_12d9 %>%
  # filter(sukupuoli %in% c("Miehet", "Naiset"), as.numeric(vuosi) >= 2006) %>%
  group_by(vuosi, ika, sukupuoli) %>%
  summarize(kuolleet_06_24 = sum(huumeisiin_kuolleet_b_luokitus, na.rm = TRUE)) %>%
  ungroup() %>%
  mutate(kuolemansyy = "huumekuolema")

itsemurhat_yht <- itsemurhat_vakivalta %>%
  filter(kuolemansyy == "itsemurha") %>%
  filter(as.numeric(vuosi) >= 2006) %>%
  filter(sukupuoli %in% c("Yhteensä")) %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_06_24_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

vakivalta_yht <- itsemurhat_vakivalta %>%
  filter(kuolemansyy == "vakivalta") %>%
  filter(as.numeric(vuosi) >= 2006) %>%
  filter(sukupuoli %in% c("Yhteensä")) %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_06_24_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

kaikki_muut_yht <- itsemurhat_vakivalta %>%
  filter(kuolemansyy == "muut") %>%
  filter(as.numeric(vuosi) >= 2006) %>%
  filter(sukupuoli %in% "Yhteensä") %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_06_24_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

huumekuolemat_yht <- statfin_ksyyt_pxt_12d9_ilman_itsemurhia %>%
  filter(sukupuoli %in% c("Yhteensä")) %>%
  filter(as.numeric(vuosi) >= 2006) %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_06_24_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

kaikki <- rbind(itsemurhat_yht, vakivalta_yht, huumekuolemat_yht, kaikki_muut_yht)

kaikki_wide <- kaikki %>%
  pivot_wider(names_from = kuolemansyy, values_from = kuolleet_06_24_yht) %>%
  mutate(muut = muut - itsemurha - vakivalta - huumekuolema) %>%
  mutate(yd_kuolemansyy = itsemurha + vakivalta + huumekuolema)

kaikki_long <- kaikki_wide %>%
  pivot_longer(!c(vuosi, sukupuoli), names_to = "kuolemansyy") %>%
  filter(kuolemansyy %in% c("muut", "yd_kuolemansyy"))  %>%
  mutate(kuolemansyy = factor(kuolemansyy, levels=c("muut", "yd_kuolemansyy")))

kaikki_long <- kaikki_long %>%
  mutate(kuolemansyy = factor(kuolemansyy, levels=c("muut", "yd_kuolemansyy"), labels = c("Muut kuolemansyyt", "Itsemurha-, huume- ja \nväkivaltakuolemat")))


itsemurhat_yht_70 <- itsemurhat_vakivalta %>%
  filter(kuolemansyy == "itsemurha") %>%
  filter(sukupuoli %in% c("Yhteensä")) %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

vakivalta_yht_70 <- itsemurhat_vakivalta %>%
  filter(kuolemansyy == "vakivalta") %>%
  filter(sukupuoli %in% c("Yhteensä")) %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

kaikki_muut_yht_70 <- itsemurhat_vakivalta %>%
  filter(kuolemansyy == "muut") %>%
  filter(sukupuoli %in% "Yhteensä") %>%
  mutate(kuolemansyy = "kaikki_kuolemansyyt") %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

huumekuolemat_yht_70 <- huumekuolemat %>%
  filter(sukupuoli %in% c("Yhteensä")) %>%
  group_by(vuosi, sukupuoli, kuolemansyy) %>%
  summarize(kuolleet_yht = sum(kuolleet_06_24, na.rm = TRUE)) %>%
  ungroup()

kaikki_70 <- rbind(itsemurhat_yht_70, vakivalta_yht_70, huumekuolemat_yht_70, kaikki_muut_yht_70) %>%
  mutate(kuolemansyy = factor(kuolemansyy, levels=c("kaikki_kuolemansyyt", "itsemurha", "huumekuolema", "vakivalta"), labels = c("Kaikki kuolemansyyt \nyhteensä", "Itsemurha", "Huumekuolema", "Väkivalta")))


itse_laskettu_keskivakiluku <- itse_laskettu_keskivakiluku %>%
  filter(as.character(vuosi) > 1960)

kaikki_70_asdr <- left_join(kaikki_70, itse_laskettu_keskivakiluku, by = join_by("vuosi" == "vuosi")) %>%
  mutate(asdr = (kuolleet_yht / keskivakiluku) * 1000)
