## Part 4
## Ranking hospitals in all states

rankall <- function(outcome, num = "best") {
    
    ## Read outcome data
    data <- data.table::fread('outcome-of-care-measures.csv')
    
    # Normalizing the argument (outcome)
    outcome <- tolower(outcome)

    # Check if state and outcome are valid
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop("Invalid Outcome")
    }
    
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}
