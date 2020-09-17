### THIS WILL PRACTICE YOUR ABILITY TO CREATE A FUNCTION

firstRowReturner <- function(item){
  return(item[1,])
}

## ^ note that the input is being called 'item'. this 'item' is the standing name
## for whatever we feed into the function.

firstRowReturner(iris)
firstRowReturner(mtcars)

## Create a function to return only the first column:

firstColumnReturner <- ________(stuff){
  ________(stuff[,1])
}

firstColumnReturner(iris)


## create a function to return the first cell (in the first row and first column)

_________ <- function(________){
  return(_____[1,1])
}

_____(iris)

