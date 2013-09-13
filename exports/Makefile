CC = clang

all : foo foo.py

foo : foo.c foo_data.c
	$(CC) -O2 -Wall -Wextra -Werror foo.c -o foo

foo_data.c : ToC.hs
	runhaskell ToC.hs

foo.py : ToPy.hs
	runhaskell ToPy.hs

clean :
	rm -f foo foo_data.c *.o foo.py foo.pyc
