#!/usr/bin/zsh

# Default build type is Debug.
BUILD_TYPE="Debug"
BUILD_DIR="build/debug"

# If the first argument is "release", switch to Release mode.
if [ "$1" = "release" ]; then
    BUILD_TYPE="Release"
    BUILD_DIR="build/release"
fi

echo "Configuring a $BUILD_TYPE build in $BUILD_DIR..."


# Configure CMake with the chosen build type.
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -S . -B $BUILD_DIR 

