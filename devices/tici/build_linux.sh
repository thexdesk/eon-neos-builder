#!/bin/bash -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
OUT=$DIR/out
LINUX=$DIR/linux
ROOT=$DIR/../..
TOOLS=$ROOT/tools

cd "$DIR"

# Config
export MACHINE=dragonboard-845c
export DISTRO=rpb
IMAGE=rpb-console-image

# Make directories if non existent
mkdir -p $OUT
mkdir -p $LINUX

# Get manifest
cd $LINUX
repo init -u https://github.com/96boards/oe-rpb-manifest.git -b qcom/warrior
repo sync -j$(nproc --all)

# Install dependencies
sudo apt-get install -y chrpath gawk texinfo

# Setup environment
source setup-environment

# Build
bitbake $IMAGE

