source("01_load_and_process_data.R")

library(ggplot2)
library(ggstats)

# Kuvio 1. 15–29-vuotiaiden nuorten kaikki kuolemat, itsemurhakuolemat, huumekuolemat ja väkivaltakuolemat 1969–2024 (ikävakioitu). Lähde: Tietokantataulut 11az ja 12d9, SVT: Kuolemansyyt ja 11rc, SVT: Väestörakenne. Tilastokeskus.

# Tuota kuvio
kuvio1 <- ggplot(data = kaikki_70_asdr, aes(x = as.numeric(vuosi), y = asdr, group = kuolemansyy)) +
  geom_line(aes(color=kuolemansyy, linetype=kuolemansyy), linewidth = 1.5/.pt) +
  labs(x = "Vuosi",
       y = "Kuolleisuusluku (per 1000 samanikäistä)",
       colour = "Kuolemansyy", linetype = "Kuolemansyy") +
  scale_colour_grey() +
  theme_bw(base_size = 8, base_family = "sans") +
  theme(legend.position = "bottom")

# Näytä kuvio
kuvio1

# Tallenna kuvio
ggsave("img/kuvio1_13x8.pdf", plot = kuvio1, width = 130, height = 80, units = "mm", dpi = 300, scale = 1)

# Kuvio 2. Itsemurha-, huume- ja väkivaltakuolemien osuus 15–29-vuotiaiden kuolemista 2006–2024, %. Lähde: Tietokantataulut 11az ja 12d9, SVT: Kuolemansyyt. Tilastokeskus.

# Tuota kuvio
kuvio2 <- ggplot(kaikki_long) +
  aes(x = as.numeric(vuosi), fill = kuolemansyy, weight = value, by = as.character(vuosi)) +
  geom_bar(color = "black") +
  labs(x = "Vuosi",
       y = "Lukumäärä (n)",
       fill = "") +
  scale_fill_grey(start = 0.5, end = 0.15) +
  theme_bw(base_size = 8, base_family = "sans") +
  theme(legend.position = "bottom", axis.title.y = element_text(angle = 90, vjust = 0.5))

kuvio2 <- kuvio2 + geom_text(
  aes(label = scales::percent(after_stat(prop), accuracy = 1)),
  stat = "prop",
  colour = 'white',
  size = 2,
  position=position_stack(vjust=0.75)
)

# Näytä kuvio
kuvio2

# Tallenna kuvio
ggsave("img/kuvio2_13x8.pdf", plot = kuvio2, width = 130, height = 80, units = "mm", dpi = 300, scale = 1)
