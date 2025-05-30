## Part 2
## Finding the best hospital in a state

best <- function(state, outcome){
    # Read outcome data
    data <- read.csv("outcome-of-care-measures.csv")
    
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}
