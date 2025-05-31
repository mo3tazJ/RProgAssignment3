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
    
    # Renaming Considered Columns to be less verbose and lowercase
    setnames(data
             , tolower(sapply(colnames(data), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
    )
    
    # Columns indices to keep
    col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(data))
    
    # Filtering out unnecessary data 
    out_dt <- data[, .SD ,.SDcols = col_indices]
    
    # Find out what class each column is 
    # sapply(fdata,class)
    # Change outcome column class
    out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
    
    ## For each state, find the hospital of the given rank
    if (num == "best"){
        return(out_dt[order(state, get(outcome), `hospital name`)
                      , .(hospital = head(`hospital name`, 1))
                      , by = state])
    }
    
    if (num == "worst"){
        return(out_dt[order(get(outcome), `hospital name`)
                      , .(hospital = tail(`hospital name`, 1))
                      , by = state])
    }
    
    ## Return a data frame with the hospital names and the (abbreviated) state name
    return(out_dt[order(state, get(outcome), `hospital name`)
                  , head(.SD,num)
                  , by = state, .SDcols = c("hospital name") ])

}
