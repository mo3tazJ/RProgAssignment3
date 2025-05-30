## Part 1
## Plot the 30-day mortality rates for heart attack

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# Some exploratory stuff
# head(outcome)
# dim(outcome)
# names(outcome)

# Sub sitting the Death Rates From Heart Attack (Column 11)
sub1 <- as.numeric(outcome[,11])

# Plotting a histogram
hist(drfhaSubset, xlab= "Deaths"
     , main = "Hospital 30-Day Death (Mortality) Rates from Heart Attack"
     , col="lightblue")
