## Part 3
## Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- data.table::fread('outcome-of-care-measures.csv')
    
    # Normalizing the arguments (outcome and state)
    outcome <- tolower(outcome)
    chosen_state <- state
    
    ## Check that state and outcome are valid
    
    
    ## Return hospital name in that state with the given rank 30-day death rate
    
    
}
