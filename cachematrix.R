## This R function is able to cache potentially time-consuming computations

## creates a special matrix, which is really a list containing a function to
## 1. create a matrix
## 2. get the value of the matrix
## 3. solve(matrix)
## 4. get solve(matrix)

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    if (!is.null(s)) {
        message("getting cached data...")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}
