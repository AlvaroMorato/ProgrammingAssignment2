## This file make the matrix inversion and stores it
## As matrix inversion usually requires a lot of computation time
## is more efficient stores the inverse for future uses

## This function recives a matrix as input, assuming that the matrix is inversible
## then computes the inverse matrix and stores (by assignment)
## the inverse and other results as a list, that is passed to the next function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse, getinverse = getinverse)

}


## This function receives the list of makeCacheMatrix and test if the result is 
## stored yet, and in this case use it.
## If the inverse is not find in the cachem, then is computed.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                print("getting")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}

        ## I think I do not understand, but it seems work or....
        ## at least does not complain
        ## ....
        
        ## Return a matrix that is the inverse of 'x'

