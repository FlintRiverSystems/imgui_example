#!/bin/bash

if [ -e build.wasm ]; then
	rm -rf build.wasm
fi

mkdir build.wasm

cd build.wasm

export EMSDK=/data/emsdk

# we're using a modified port of imgui that has the sdl dependency removed.
# Emscripten already provides SDL2, and the sdl2 port in vcpkg won't compile for wasm32-emscrpten

cmake \
	-DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=$EMSDK/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake \
	-DVCPKG_TARGET_TRIPLET=wasm32-emscripten \
	-DVCPKG_OVERLAY_PORTS=../vcpkg_ports \
	-DWASM=TRUE \
	..

make

