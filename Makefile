hello: hello.f90
	gfortran -o hello hello.f90
run: hello
	./hello
clean:
	rm -f hello