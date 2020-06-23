#! /usr/bin/env Rscript
require(docopt)

print("hello")
exit()
iteratorfactory <- function(x) {
  function() {
    ret <<- x
    x <<- x+1
    ret
  }
}

flash <- function(filename, key_column = NA, value_column=NA) {
  flash_data <- read.csv(filename, header=T)
  if( is.na(key_column) ) {
    print("Available columns are")
    print(colnames(flash_data))
    key_column <- readline("Please enter the name of the data you will be shown:")
  }
  
  if( is.na(value_column) ) {
    print("Available columns are")
    print(colnames(flash_data))
    value_column <- readline("Please enter the name of the data you will be answering:")
  }
  
  keys <- flash_data[[key_column]]
  values <- flash_data[[value_column]]
  names(values) <- keys
  
  remaining <- rep(3L, length(values))
  
  correct <- rep(0L, length(values))
  total <- rep(0L, length(values))
  prev_value <- -1
  
  while(sum(remaining)>0) {
    curr_value <- sample(length(values), 1, prob = remaining)
    if( curr_value == prev_value ) curr_value <- sample(length(values), 1, prob = remaining)
    prev_value <- curr_value
    answer <- readline(paste(key_column, " ", names(values)[curr_value], ". ", value_column, "?", sep=""))
    if( answer == values[curr_value])
    {
      print("Correct!")
      remaining[curr_value] <- remaining[curr_value]-1
      correct[curr_value] <- correct[curr_value] +1
      total[curr_value] <- total[curr_value] + 1
    }
    else
    {
      print(paste("Sorry. Correct answer is", values[curr_value]))
      remaining[curr_value] <- remaining[curr_value]+2
      total[curr_value] <- total[curr_value] + 1
    }
    print(values[curr_value])
  }
  foo <- as.double(correct)/as.double(total)
  foo
}

readinteger <- function()
{ 
  n <- readline(prompt="Enter an integer: ")
  n <- as.integer(n)
  if (is.na(n)){
    n <- readinteger()
  }
  return(n)
}



poidafra <- function(n){
  current.N <- 10 * n
  my.df <- data.frame(a=character(current.N),
                      b=numeric(current.N),stringsAsFactors = F)
  count <- 0
  for(i in 1:n) {
    this.N <- rpois(1, 10)
    if(count + this.N > current.N) {
      old.df <- my.df
      current.N <- round(1.5 * (current.N + this.N))
      my.df <- data.frame(a=character(current.N),
                          b=numeric(current.N),stringsAsFactors = F)
      my.df[1:count,] <- old.df[1:count, ]
    }
    my.df[count + 1:this.N,] <-
      data.frame(a=sample(letters, this.N, replace=TRUE), 
                 b=runif(this.N),stringsAsFactors = F)
    count <- count + this.N
    cat('point 1 mem', memory.size(), memory.size(max=TRUE), '\n')
  }
  my.df <- my.df[1:count,]
  my.df
}
