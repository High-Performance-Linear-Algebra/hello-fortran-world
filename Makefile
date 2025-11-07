hello: hello.f90
	gfortran -o hello hello.f90
test: hello
	./hello
clean:
	rm -f hello