all : src/JacobiRootsBinary.hs

src/JacobiRootsBinary.hs : gen/JacobiRootsRaw300.hs gen/Convert.hs
	cd gen && runhaskell -Wall -Werror Convert.hs

clean :
	rm -f src/JacobiRootsBinary.hs
