## Part 2
## Finding the best hospital in a state

# install.packages("data.table")
# install.packages('bit64')
# library("data.table")

best <- function(state, outcome){
    # Read outcome data
    data <- data.table::fread('outcome-of-care-measures.csv')
    
    # Normalizing the arguments (outcome and state)
    outcome <- tolower(outcome)
    choosen_state <- state
    
    # Check if state and outcome are valid
    if(!chosen_state %in% unique(data[["State"]])){
        stop("Invalid State")
    }
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop("Invalid Outcome")
    }

    # Renaming Columns to be less verbose and lowercase
    setnames(data
             , tolower(sapply(colnames(data), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
    )
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}
