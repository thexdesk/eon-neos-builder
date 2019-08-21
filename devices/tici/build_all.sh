#!/bin/bash -e
./build_linux.sh
./build_boot.sh
./build_system.sh
./build_vbmeta.sh

