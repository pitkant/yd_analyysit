Tilastotietojen lataamisessa Tilastokeskuksen StatFin-tietokannasta
käytetään [pxweb-pakettia](https://ropengov.github.io/pxweb/). Paketti
mahdollistaa hakujen tekemisen tekstipohjaisesta käyttöliittymästä,
jolloin haut ovat tallennettavissa, helposti toistettavissa ja
muokattavissa suoraan R:stä. `pxweb`-paketti toimii monien eri
pxweb-tietokantojen kanssa eri maissa. `pxweb`-paketti on kehitetty
osana [rOpenGov](https://ropengov.org) -pakettiekosysteemiä.

Datan käsittelyyn (data wrangling) käytetään
[tidyverseen](https://www.tidyverse.org) kuuluvia `ggplot2`-, `dplyr`-
ja `tidyr`-paketteja. Kuvion 2 sisältämien prosenttiosuuksien
laskemiseen on käytetty `ggstats`-pakettia.

Datasettien nimien siivoamiseen käytetään `janitor`-pakettia.

Tilastokeskuksen aineistosta “11s1 – Keskiväkiluku iän ja sukupuolen
mukaan alueittain, 1981-2024”
([statfin\_vaerak\_pxt\_11s1](https://pxdata.stat.fi/PxWeb/pxweb/fi/StatFin/StatFin__vaerak/statfin_vaerak_pxt_11s1.px/))
saadaan tietoja vain vuoteen 1981 asti. Tästä johtuen myöhemmin tässä
työkirjassa käytetään itse laskettua keskiväkilukua, mutta
valmisaineisto ladataan tässä esimerkinomaisesti muistutuksena siitä,
että tällainenkin on olemassa.

# Koodin ajaminen

Datan lataaminen ja käsittely on tiedostossa
`01_load_and_process_data.R`. Datan visualisointiin liittyvä koodi ja
artikkelissa käytettyjen kuvioiden toistamiseen tarvittava koodi on
tiedostossa `02_create_visualizations.R`. Jälkimmäinen tiedostos
tarvitsee ensimmäisessä tiedostossa luotuja muuttujia kuvioiden
tuottamiseen, joten skriptitiedosto `02_create_visualizations.R`
sisältää itsessään `source("01_load_and_process_data.R")` komennon.

# Toistettavuus

Analyyseissa käytetyt R-paketit on nimetty skriptitiedostojen alussa
`library()`-komennolla. Kansiossa on myös `renv.lock` -tiedosto johon on
listattu jokainen käytetty R-paketti ja näiden riippuvuudet. Käytetyt
R-paketit voi ladata omaan projektiin käyttämällä renv-paketin
`renv::activate()`-komentoa.

## Session Info

    R version 4.5.2 (2025-10-31)
    Platform: aarch64-apple-darwin20
    Running under: macOS Tahoe 26.3

    Matrix products: default
    BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
    LAPACK: /Library/Frameworks/R.framework/Versions/4.5-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1

    locale:
    [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

    time zone: Europe/Helsinki
    tzcode source: internal

    attached base packages:
    [1] stats     graphics  grDevices datasets  utils     methods   base     

    other attached packages:
    [1] ggstats_0.12.0 ggplot2_4.0.2  renv_1.1.7     janitor_2.2.1  tidyr_1.3.2    dplyr_1.2.0    pxweb_0.17.0  

    loaded via a namespace (and not attached):
     [1] gtable_0.3.6       jsonlite_2.0.0     compiler_4.5.2     tidyselect_1.2.1   stringr_1.6.0      snakecase_0.11.1   scales_1.4.0       R6_2.6.1          
     [9] labeling_0.4.3     generics_0.1.4     curl_7.0.0         backports_1.5.0    checkmate_2.3.4    tibble_3.3.1       lubridate_1.9.5    pillar_1.11.1     
    [17] RColorBrewer_1.1-3 rlang_1.1.7        stringi_1.8.7      S7_0.2.1           timechange_0.4.0   cli_3.6.5          withr_3.0.2        magrittr_2.0.4    
    [25] grid_4.5.2         lifecycle_1.0.5    vctrs_0.7.1        glue_1.8.0         farver_2.1.2       purrr_1.2.1        httr_1.4.8         tools_4.5.2       
    [33] pkgconfig_2.0.3  

# Käytetyt paketit

Firke S (2024). *janitor: Simple Tools for Examining and Cleaning Dirty
Data*. <doi:10.32614/CRAN.package.janitor>
<https://doi.org/10.32614/CRAN.package.janitor>, R package version
2.2.1, <https://CRAN.R-project.org/package=janitor>.

Larmarange J (2025). *ggstats: Extension to ‘ggplot2’ for Plotting
Stats*. R package version 0.12.0,
<https://larmarange.github.io/ggstats/>.

Magnusson M, Kainu M, Huovari J, Lahti L (2025). *pxweb: R Interface to
PXWEB APIs*. <doi:10.32614/CRAN.package.pxweb>
<https://doi.org/10.32614/CRAN.package.pxweb>, R package version 0.17.0,
<https://github.com/rOpenGov/pxweb>.

Ushey K, Wickham H (2026). *renv: Project Environments*.
<doi:10.32614/CRAN.package.renv>
<https://doi.org/10.32614/CRAN.package.renv>, R package version 1.1.7,
<https://CRAN.R-project.org/package=renv>.

Wickham H, François R, Henry L, Müller K, Vaughan D (2026). *dplyr: A
Grammar of Data Manipulation*. <doi:10.32614/CRAN.package.dplyr>
<https://doi.org/10.32614/CRAN.package.dplyr>, R package version 1.2.0,
<https://CRAN.R-project.org/package=dplyr>.

Wickham H, Vaughan D, Girlich M (2025). *tidyr: Tidy Messy Data*.
<doi:10.32614/CRAN.package.tidyr>
<https://doi.org/10.32614/CRAN.package.tidyr>, R package version 1.3.2,
<https://CRAN.R-project.org/package=tidyr>.

Wickham H (2016). *ggplot2: Elegant Graphics for Data Analysis*.
Springer-Verlag New York.
