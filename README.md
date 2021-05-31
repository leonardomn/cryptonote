## Ultimate Hacking Coin
UHC is a PoW (Proof of Work) coin. Each server node or user could use that as they want. The intent of this coin is to provide
I.T professionals around the globe to receive and send coins when working to someone. At same time, this coin is to give us, I.T professionals something nice to do.

## How to start?

### Preparation to be a seed node
When building the seed node, you will have all binaries, and you will be able to use the full capabilities coming from UHC 

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

### Mining with Docker Container
You can run the UHC from a container, the container will come with a full version of all binaries, and it should run with a single command.

Dependencies: Docker

* https://www.docker.com

To run docker container you will need to:
```
docker run -it leonardomn/uhc
```

Inside the docker you will find all binaries inside /root

* Run ./simplewallet
* Generate your Wallet
* Run start_mining

Your wallet could mine from the docker container, and after some minutes or hours depending on your computer configuration, you will see your balance when typing balance. If you have any friend using UHC, you will be able to transfer
your amount of coins to his wallet too. You can have some fun!

Note: Always save your wallet when done with your work using container, if you delete the container you will delete the wallet. You can mount a local directory and save it from there preventing to lose the file.

### Building own Docker Image
You can build your own container image if you prefer not to use the one in dockerhub.

To build the docker image you can either do it with BuildKit:
```
docker buildx build --platform linux/amd64 --build-arg THREADS=16 -t uhc .
```
or with default docker builder:
```
docker build --build-arg THREADS=16 -t uhc .
```

* All binaries can be found inside /opt/uhc
* THREADS is the arg for paralellism during build time. If not specified, 1 will be used
* After starting the container, you will have to wait for it to finish synchronizing
* Then you can type start_mining wallet_address number-of-threads

E.g.:
```
start_mining hackeyNbPcHahhyNyrwrbUMonruLGWb1UZzJ2uvLDvb5dvRHBHxeaVj1jCHjEfhCBK8ukoE2enoXa5YAopgaBeBz5QNPJvu2EW 16
```
### Binaries in this project
Short description describing what is the binary, for more information of how to use always run the binary with --help

* connectivity_tool (tool responsible to test your connectivity)
* miner (miner used to mine coins)
* simplewallet (wallet and miner)
* uhcd (uhc daemon)
* walletd (wallet daemon)
