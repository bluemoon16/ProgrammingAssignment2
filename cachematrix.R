## Below are two functions that are used to create a special object that stores a invertible matrix and cache its inversion.

## The first function, makeCacheMatrix, creates a special "matrix" object that can cache its inverse. 

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  get <- function() x
  setinverse <- function(inverse) 
    m <<- inverse
  getinverse <- function() m
  list(get = get, setinverse = setinverse, getinverse = getinverse)
}


## The second function, cacheSolve, computes the inverse of the special "matrix" returned by makeCacheMatrix above.  
## If the inverse has already been calculated (and the matrix has not changed), the the cacheSolve will retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
        ## Return a matrix that is the inverse of 'x'
       }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
