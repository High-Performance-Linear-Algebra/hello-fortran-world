# Hello Fortran World

![CI](https://github.com/High-Performance-Linear-Algebra/hello-fortran-world/actions/workflows/ci.yml/badge.svg?branch=main)

A simple "Hello, World!" project in Fortran demonstrating modern software development practices including build automation with Make and continuous integration with GitHub Actions.

## Project Overview

This project serves as a template for Fortran development with automated building and testing. It demonstrates:
- Writing a basic Fortran program
- Building with Make
- Automated testing via GitHub Actions CI/CD

## The Fortran Code

The main program is contained in `hello.f90`:

```fortran
program hello
    use iso_fortran_env, only: output_unit
    implicit none
    write(output_unit, '("Hello, World!")')
end program hello
```

### Code Explanation

- **`program hello`**: Defines a Fortran program named "hello"
- **`use iso_fortran_env, only: output_unit`**: Imports the standard output unit from the ISO Fortran environment module for portable I/O
- **`implicit none`**: Enforces explicit variable declaration (best practice)
- **`write(output_unit, '("Hello, World!")')`**: Writes "Hello, World!" to standard output using a formatted write statement
- **`end program hello`**: Marks the end of the program

The use of `iso_fortran_env` and `output_unit` makes this code portable across different systems and compilers, following modern Fortran standards.

## The Makefile

The `Makefile` automates the build and test process:

```make
hello: hello.f90
	gfortran -o hello hello.f90

test: hello
	./hello

clean:
	rm -f hello
```

### Makefile Targets

- **`hello`** (default target): Compiles `hello.f90` using the GNU Fortran compiler (`gfortran`) to create the `hello` executable
  - Dependency: `hello.f90` source file
  - Command: `gfortran -o hello hello.f90`

- **`test`**: Builds and runs the program to verify it works correctly
  - Dependency: `hello` executable (will build if needed)
  - Command: `./hello`

- **`clean`**: Removes the compiled executable for a fresh build
  - Command: `rm -f hello` (the `-f` flag prevents errors if the file doesn't exist)

### Usage

```bash
# Build the executable
make

# Build and run the program
make test

# Clean up compiled files
make clean
```

## Continuous Integration (CI)

The project uses GitHub Actions for automated testing on every push to the `main` branch. The CI workflow is defined in `.github/workflows/ci.yml`:

```yaml
name: CI
on:
  push:
    branches:
      - main
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Setup Fortran
        uses: fortran-lang/setup-fortran@v1.8.0
        with:
          compiler: gcc
          version: 'latest'
          update-environment: true
      - name: Build
        run: make
      - name: Test
        run: make test
```

### CI Workflow Breakdown

1. **Trigger**: Runs automatically on every push to the `main` branch

2. **Environment**: Uses the latest Ubuntu Linux runner (`ubuntu-latest`)

3. **Steps**:
   - **Checkout code**: Uses `actions/checkout@v4` to clone the repository
   - **Setup Fortran**: Uses `fortran-lang/setup-fortran@v1.8.0` to install the GNU Fortran compiler (gfortran)
     - Installs the latest version of GCC's gfortran
     - Updates the environment to make gfortran available
   - **Build**: Runs `make` to compile the program
   - **Test**: Runs `make test` to execute the program and verify it works

If any step fails, the CI run fails, alerting you to problems with the code or build process.

## GitHub Status Badges

GitHub badges are visual indicators that display the status of your project directly in the README. They provide at-a-glance information about build status, test results, and other metrics.

### Adding a CI Status Badge

To show that your repository is passing the CI run, you can add a workflow status badge at the top of your README:

```markdown
![CI](https://github.com/High-Performance-Linear-Algebra/hello-fortran-world/workflows/CI/badge.svg)
```

Or with a link to the Actions page:

```markdown
[![CI](https://github.com/High-Performance-Linear-Algebra/hello-fortran-world/workflows/CI/badge.svg)](https://github.com/High-Performance-Linear-Algebra/hello-fortran-world/actions)
```

### Badge Explanation

- **URL Format**: `https://github.com/{owner}/{repo}/workflows/{workflow-name}/badge.svg`
  - `{owner}`: Repository owner (High-Performance-Linear-Algebra)
  - `{repo}`: Repository name (hello-fortran-world)
  - `{workflow-name}`: Name of the workflow as defined in the YAML file (CI)

- **Badge States**:
  - **Green badge with "passing"**: All CI tests are passing
  - **Red badge with "failing"**: One or more CI tests failed
  - **Yellow badge with "pending"**: CI is currently running
  - **Gray badge with "no status"**: No CI runs yet or workflow disabled

### Alternative Badge Format

You can also specify the branch and use the actions badge endpoint:

```markdown
![CI](https://github.com/High-Performance-Linear-Algebra/hello-fortran-world/actions/workflows/ci.yml/badge.svg?branch=main)
```

This format is more reliable as it references the specific workflow file (`ci.yml`) and branch.

### Benefits of Status Badges

- **Instant Visibility**: Users can immediately see if the project builds successfully
- **Trust Indicator**: A passing badge shows the code is maintained and functional
- **Transparency**: Demonstrates commitment to quality and testing
- **Quick Reference**: Click the badge to view detailed CI run history

Badges are typically placed at the top of the README, right after the title or in a dedicated "Status" section.

## Getting Started

### Prerequisites

- GNU Fortran compiler (gfortran)
- Make

### Installation on Linux/macOS

```bash
# Ubuntu/Debian
sudo apt-get install gfortran make

# Fedora/RHEL
sudo dnf install gcc-gfortran make

# macOS (via Homebrew)
brew install gcc make
```

### Building and Running

```bash
# Clone the repository
git clone https://github.com/High-Performance-Linear-Algebra/hello-fortran-world.git
cd hello-fortran-world

# Build the program
make

# Run the program
./hello

# Or build and run in one command
make test

# Clean up
make clean
```

## Expected Output

```
Hello, World!
```

## License

See the [LICENSE](LICENSE) file for details.

## Contributing

This project serves as a basic template for Fortran development with CI/CD. Feel free to fork and adapt it for your own projects!