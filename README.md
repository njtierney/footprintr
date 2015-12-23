# footprintr

This package is my attempt at cloning the super cool and way sexier "csv-fingerprint" from flowing data - see [here](https://github.com/setosa/csv-fingerprint) and [here](https://flowingdata.com/2014/08/14/csv-fingerprint-spot-errors-in-your-data-at-a-glance/)

I have named this package "footprintr" over something like "csvFingerprint", as it isn't as precise as a fingerprint, and it doesn't do the same thing as csv-fingerprint.

# What does it do?

footprintr is a small r package that visualises a csv file, displaying missing data and variable classes with different colours. Future work will allow for each cell to be colored according to its type (e.g., strings, factors, integers, decimals, dates, missing data).

This is very simple so far, as currently it's just a quick and dirty proof-of-concept to get the ball rolling. Initially I was going to add this to my regular [`neato` repository](https://github.com/tierneyn/neato), but I did not, as I wanted to practice writing r packages quickly. I also think that it has great scope to  to get into the habit of making R packages that do just one thing.

# How to install

```
# install.packages("devtools")

library(devtools)

install_github("tierneyn/footprintr")
```

# Example

Use the example2 dataset from csv-fingerprint.

```
library(footprintr)

ggplot_footprint(example2)
```

# Known Issues.

**Individual cells do not have an individual class**
Due to the fact that R coerces a vector to be the same type, this means that you cannot have something like c("a", 1L, 10.555) together as a vector, as it will just convert this to `[1] "a"      "1"      "10.555"`. This means that you don't get the ideal feature of picking up on nuances such as individuals cells that are different classes in the dataframe. Perhaps there is a way to read in a csv as a list so that these features are preserved?

**Missing Data not listed in legend**

When running the example below, the gray bars indicate missing values, but these are currently not specified as missing values.
