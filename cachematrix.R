## Put comments here that give an overall description of what your 
## functions do

## Write a short comment describing this function

## Caching the Inverse of a Matrix:
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
          inv <- NULL
          set <- function(y) {
          x <<- y
          inv <<- NULL
  }
  
          get <- function() x
          setInv <- function(inverse) inv <<- inverse
          getInv <- function() inv
          list(set = set,
          get = get,
          setInv = setInv,
          getInv = getInv)
}


## Let's now create inverse of the matrix created above. 
## If we have already calculated the inverse then this will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInv()
        if (!is.null(inv)) {
           message("Get cached data")
        return(inv)
  }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInv(inv)
        inv
}
