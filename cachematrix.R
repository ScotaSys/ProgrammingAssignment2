## Matrix inversion is a costly computational process. Caching the results of previously
## computed inversions can speed up the process. If a matrix inversion results
## is in the cache then this can be used thus avoiding the need to re-calculate the result.
##
## MakeCacheMatrix and cacheSolve are functions that cache the inverse of a matrix.

## makeCacheMatrix ------ this function creates a list containing a functions to
##
##     	1. set the value of a matrix
##		2. get the value of a matrix
##		3. set (create) the inverse of a matrix
##		4. get (return) the inverse of a matrix
## 		
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
				x <<- y
				m <<- NULL
			}
get <- function() x


setInvMatrix <- function(solve) m <<- solve
getInvMatrix <- function() m

list(set=set, get=get, setInvMatrix=setInvMatrix, getInvMatrix=getInvMatrix)
}


## cacheSolve ------ This function returns the inverse of a matrix.
##
## The function first checks to see if the inverse of a matrix has been computed. If it 
## has then the function returns the result. Otherwise the function calculates the 
## inverse of the matrix and sets the value in the cache using the setInvMatrix function.
##
## This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
m <-x$getInvMatrix()
    
if(!is.null(m)){
    return(m)
}
    
	matrix <- x$get()
    m <- solve(matrix, ...)
    x$setInvMatrix(m)
    m		
}
