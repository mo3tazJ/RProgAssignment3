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
    
    #Filter by state
    fdata <- data[state == chosen_state]
    
    # Columns indices to keep
    col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(data))
    
    # Filtering out unnecessary data 
    fdata <- fdata[, .SD ,.SDcols = col_indices]
    
    # Find out what class each column is 
    # sapply(fdata,class)
    fdata[, outcome] <- fdata[,  as.numeric(get(outcome))]
    
    # Removing Missing Values for numerical datatype (outcome column)
    output <- fdata[complete.cases(fdata),]
    
    
    
    ## Return hospital name in that state with the given rank 30-day death rate
    
    
}
