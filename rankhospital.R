## Part 3
## Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- data.table::fread('outcome-of-care-measures.csv')
    
    # Normalizing the arguments (outcome and state)
    outcome <- tolower(outcome)
    chosen_state <- state
    
    # Check if state and outcome are valid
    if(!chosen_state %in% unique(data[["State"]])){
        stop("Invalid State")
    }
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop("Invalid Outcome")
    }
    
    # Renaming Considered Columns to be less verbose and lowercase
    setnames(data
             , tolower(sapply(colnames(data), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
    )
    
    
    ## Return hospital name in that state with the given rank 30-day death rate
    
    
}
