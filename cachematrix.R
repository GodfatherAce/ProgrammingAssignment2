# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# cacheSolve: This function computes the inverse of the special "matrix" returned

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      # set the value of the matrix
      set <- function(y) {
            x <<- y
            inv <<- NULL
      }
      # get the value of the matrix
      get <- function() x
      # set the value of the inverse
      setinverse <- function(inverse) inv <<- inverse
      # get the value of the inverse
      getinverse <- function() inv
      # return:
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}
cacheSolve <- function(x, ...) {
      inv <- x$getinverse() # function() inv
      if(!is.null(inv)) {
            message("getting cached data")
            return(inv) # return ends the function
      }
      data <- x$get() # function() x
      inv <- solve(data, ...) # calculates the inverse and stores it as inv
      x$setinverse(inv) # function(inverse) inv <<- inverse
      inv
}
