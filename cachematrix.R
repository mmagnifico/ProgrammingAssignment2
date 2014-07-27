## This function creates a special "matrix" object that can cache its inverse.

## Write a short comment describing this function

	mat = matrix()
	set = function(y) {
		x <<- y
		mat <<- matrix()
	}
	get = function() x
	setinverse = function(solve) mat <<- solve
	getinverse = function() mat
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

        mat = x$getinverse()
 	  if(sum(as.numeric(!mapply(is.na, test_mat))) > 0) {
                message("getting cached data")
                return(mat)
        }
        matdata = x$get()
        mat = solve(matdata, ...)
        x$setinverse(mat)
        mat

}