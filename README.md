
<!-- README.md is generated from README.Rmd. Please edit that file -->
kotzeb0912: An R package of data from a satellite telemetry study of bearded seals in Alaska
============================================================================================

Executive Summary
-----------------

Bearded seals (*Erignathus barbatus*) are one of the most important subsistence resources for the indigenous people of coastal northern and western Alaska, as well as key components of Arctic marine ecosystems, yet relatively little about their abundance, seasonal distribution, migrations, or foraging behaviors has been documented scientifically. Ice-associated seal populations may be negatively impacted by offshore oil and gas development as well as by climate change. Our ability to predict impacts, however, is limited by inadequate knowledge of seal population structure and foraging ecology. By working cooperatively with Alaska Native subsistence hunters we developed methods for live-capturing bearded seals in the Chukchi Sea using nets set in the shallow coastal waters where bearded seals were foraging. Capture efforts were based out of Kotzebue and various locations in the North Slope Borough from Wainwright to Barrow in June and July from 2009 to 2012. In all, 7 seals were caught (2 adults and 5 sub-adults; 4 males and three females; ranging in length and weight from 159 cm and 116 kg to 216 cm and 253 kg), all from Kotzebue Sound. Each seal was sampled for health and condition and released with three different types of satellite-linked bio-loggers: the SPOT5, attached to a rear flipper, provided information on the timing of hauling out and on the seal’s location for up to three years; the MK10, glued to the top of a seal’s head, provided Argos estimates of location and also provided data on the timing and depths of dives, for up to ten months; the Mk10-AF, also glued to the top of the head, provided GPS quality locations in addition to the Argos estimates of location and dive behavior data.

The final contract report for this research is available from the [Bureau of Ocean and Energy Management](http://www.boem.gov/BOEM-Newsroom/Library/Publications/2013/BOEM_2013_001150_pdf.aspx)

### Installation

Installation of this R data package is done through the `devtools::install_github()` function or by downloading the [source package from the latest release](https://github.com/jmlondon/kotzeb0912/releases).

``` r
library("devtools")
install_github("jmlondon/kotzeb0912")
```

### Citation

This R package has been archived with Zenodo and a citable DOI created for each release.

<a href="https://zenodo.org/badge/latestdoi/22898/jmlondon/kotzeb0912"><img src="https://zenodo.org/badge/22898/jmlondon/kotzeb0912.svg"></a>

Please cite this package as:

> London, Josh M., Cameron, M. F., & Boveng, P. L. (2016, July 9). kotzeb0912: An R package of data from a satellite telemetry study of bearded seals in Alaska. Zenodo. <https://doi.org/10.5281/zenodo.591327>

Note this citation and the link above will always resolve to the latest release version archived at Zenodo.

### License

Software code created by U.S. Government employees is not subject to copyright in the United States (17 U.S.C. §105). The United States/Department of Commerce reserve all rights to seek and obtain copyright protection in countries other than the United States for Software authored in its entirety by the Department of Commerce. To this end, the Department of Commerce hereby grants to Recipient a royalty-free, nonexclusive license to use, copy, and create derivative works of the Software outside of the United States.

For additional clarity, authors of this package waive copyright and related rights in the work worldwide through the CC0 1.0 Universal Public Domain Dedication (which can be found at <https://creativecommons.org/publicdomain/zero/1.0/>).

As a scientific work, an in keeping with common scientific practicies, we kindly request that you cite our research project and applicable publications if you use our work(s) or data in your publications or presentations.

### Contributions

We welcome contributions from everyone. Before you get started, please see our [contributor guidelines](CONTRIBUTING.md). Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

------------------------------------------------------------------------

##### NOAA/Dept. of Commerce Disclaimer

<sub>This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.</sub>
