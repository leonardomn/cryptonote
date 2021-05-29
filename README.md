## Ultimate Hacking Coin - forking how-to

### Preparation

1. Create an account on [GitHub.com](github.com)
2. Fork [UHC repository](https://github.com/leonardomn/uhc)
3. Buy one or two Ubuntu-based (14.04) dedicated servers (at least 2Gb of RAM) for seed nodes. 
4. Edit the file src/CryptoNoteConfig.H adding your servers on line 108. like: "server_ip:42000"
5. Push the PR with the New Servers and Build your Code following the steps below
6. When done, create your wallet and run uhcd daemon. You can start mining from your wallet!

### On *nix

Dependencies: GCC 4.7.3 or later, CMake 2.8.6 or later, and Boost 1.55.

You may download them from:

* http://gcc.gnu.org/
* http://www.cmake.org/
* http://www.boost.org/
* Alternatively, it may be possible to install them using a package manager like apt. 

To build, change to a directory where this file is located, and run `make`. The resulting executables can be found in `build/release/src`.

**Advanced options:**

* Parallel build: run `make -j<number of threads>` instead of `make`.
* Debug build: run `make build-debug`.
* Test suite: run `make test-release` to run tests in addition to building. Running `make test-debug` will do the same to the debug version.
* Building with Clang: it may be possible to use Clang instead of GCC, but this may not work everywhere. To build, run `export CC=clang CXX=clang++` before running `make`.

### On Windows
Dependencies: MSVC 2013 or later, CMake 2.8.6 or later, and Boost 1.55. You may download them from:

* http://www.microsoft.com/
* http://www.cmake.org/
* http://www.boost.org/

To build, change to a directory where this file is located, and run theas commands: 
```
mkdir build
cd build
cmake -G "Visual Studio 12 Win64" ..
```

And then do Build.
Good luck!