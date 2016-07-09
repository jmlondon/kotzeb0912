kotzeb0912: An R package of data from a satellite telemetry study of bearded seals in Alaska
--------------------------------------------------------------------------------------------

#### Josh M. London, Michael F. Cameron, and Peter L. Boveng

#### NOAA Fisheries (NMFS) Alaska Fisheries Science Center

This R package has been archived with Zenodo and a citable DOI created for each release.

<a href="https://zenodo.org/badge/latestdoi/22898/jmlondon/kotzeb0912"><img src="https://zenodo.org/badge/22898/jmlondon/kotzeb0912.svg"></a>

Executive Summary
-----------------

Bearded seals (*Erignathus barbatus*) are one of the most important subsistence resources for the indigenous people of coastal northern and western Alaska, as well as key components of Arctic marine ecosystems, yet relatively little about their abundance, seasonal distribution, migrations, or foraging behaviors has been documented scientifically. Ice-associated seal populations may be negatively impacted by offshore oil and gas development as well as by climate change. Our ability to predict impacts, however, is limited by inadequate knowledge of seal population structure and foraging ecology. By working cooperatively with Alaska Native subsistence hunters we developed methods for live-capturing bearded seals in the Chukchi Sea using nets set in the shallow coastal waters where bearded seals were foraging. Capture efforts were based out of Kotzebue and various locations in the North Slope Borough from Wainwright to Barrow in June and July from 2009 to 2012. In all, 7 seals were caught (2 adults and 5 sub-adults; 4 males and three females; ranging in length and weight from 159 cm and 116 kg to 216 cm and 253 kg), all from Kotzebue Sound. Each seal was sampled for health and condition and released with three different types of satellite-linked bio-loggers: the SPOT5, attached to a rear flipper, provided information on the timing of hauling out and on the seal’s location for up to three years; the MK10, glued to the top of a seal’s head, provided Argos estimates of location and also provided data on the timing and depths of dives, for up to ten months; the Mk10-AF, also glued to the top of the head, provided GPS quality locations in addition to the Argos estimates of location and dive behavior data.

The final contract report for this research is available from the [Bureau of Ocean and Energy Management](http://www.boem.gov/BOEM-Newsroom/Library/Publications/2013/BOEM_2013_001150_pdf.aspx)

Installation
------------

Installation of this R data package is done through the `devtools::install_github()` function or by downloading the [source package from the latest release](https://github.com/jmlondon/kotzeb0912/releases).

``` r
library("devtools")
install_github("jmlondon/wcUtils")
```

------------------------------------------------------------------------

##### Disclaimer

<sub>This repository is a scientific product and is not official communication of the Alaska Fisheries Science Center, the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All AFSC Marine Mammal Laboratory (AFSC-MML) GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. AFSC-MML has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.</sub>
