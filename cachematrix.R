# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  inverseSet <- function(inverse) inv <<- inverse
  inverseGet <- function() inv
  list(set = set,
       get = get,
       setInverse = inverseSet,
       getInverse = inverseGet)
}
# This function computes the inverse of the special "matrix" created by makeCacheMatrix
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  # Return a matrix that is the inverse of 'x'
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}