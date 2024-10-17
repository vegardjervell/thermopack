This release is automatically updated whenever a pull request is merged to `main`.

For stable releases of `ThermoPack`, see releases named `vX.Y.Z`.

## Installing wheels for Python

To install this release for Python, download and unzip the appropriate `wheel*-.zip` file, then install with `pip install thermopack -f wheel-<version>-<system>/`, where `wheel-<version>-<system>` is the directory created by unzipping the file.

For macOS, the wheels marked `macOS-12` are built for `x86_64` machines (using intel chips), while `macOS-latest` wheels are built for `arm64` machines (Apple Silicon, i.e. M1, M2, etc.).

## Installing the cppThermopack library

For linking with C++ programs, download the appropriate `thermopack-<system>.zip` file, and unzip the file. Then 
`export THERMOPACK_DIR=thermopack-<system>`, where `thermopack-<system>` is the directory created from the unzipped file. This should allow `CMake` to find the thermopack library and header files when including thermopack using `CMake`'s `find_library`.

Documentation and user guides for the latest version are found at [thermotools.github.io/thermopack](thermotools.github.io/thermopack), but are likely not as well maintained as the documentation and guides for stable releases.