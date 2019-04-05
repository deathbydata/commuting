Commuting in LA
================

Summary
-------

Anyone living in LA will know that spending time behind the wheel is part of life in this part of the world. In this document I visualize some of the data I have collected over the last few months on my commuting times in the drive between Marina Del Rey and my office in Santa Monica.

To collect the data I just created a Google Form which I then saved a link to on my phone. I (try to) record my time every day I take the car (which is not every day) and the results are then automatically saved into a Google Sheet.

Setup
-----

### Load Packages

First we will load in the packages we need including the excellent `googlesheets` as well as our own `redbull` package for chart formatting.

``` r
library(googlesheets)
library(tidyverse)
library(magrittr)
library(redbull)
library(lubridate)
```

``` r
source("R/get_commuting_data.R")
```

Connect to our Google Sheet and extract the data we need.

``` r
comm_data <- get_commuting_data(commuting_sheet_key)
comm_data_clean <- clean_commuting_data(comm_data)
```

Ok so let's look at monthly commute time averages.

![](README_files/figure-markdown_github/plot%20commute%20by%20month-1.png)

And a more granular view...

![](README_files/figure-markdown_github/plot%20all%20commutes-1.png)

What is the impact of travelling on different weekdays?

![](README_files/figure-markdown_github/plot%20weekdays-1.png)

Finally - how much does the time I leave affect my commute?

![](README_files/figure-markdown_github/plot%20commute%20vs%20departure-1.png)
