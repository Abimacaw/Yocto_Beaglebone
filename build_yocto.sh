#!/bin/bash
#Automated script for build
# Set environment variables
YOCTO_VERSION="kirkstone"
BUILD_DIR="bbb_build"
MACHINE="beaglebone"
IMAGE="core-image-minimal"

# Step 1: Create a working directory for Yocto and change to that directory
WORK_DIR="$HOME/YOCTO"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR" || exit 1

# Step 2: Clone the Yocto Poky repository (Kirkstone version)
if [ ! -d "poky" ]; then
    echo "Cloning Poky for Yocto (Version: $YOCTO_VERSION)..."
    git clone --branch $YOCTO_VERSION git://git.yoctoproject.org/poky.git
else
    echo "Poky repository already exists, skipping clone."
fi

# Step 3: Source the environment setup script
cd poky || exit 1
echo "Sourcing the environment..."
source oe-init-build-env ../$BUILD_DIR

# Step 4: Modify local.conf to set MACHINE to BeagleBone
LOCAL_CONF="conf/local.conf"
if grep -q "^MACHINE" "$LOCAL_CONF"; then
    sed -i "s/^MACHINE.*/MACHINE = \"$MACHINE\"/" "$LOCAL_CONF"
else
    echo "MACHINE = \"$MACHINE\"" >> "$LOCAL_CONF"
fi

# Step 5: Start the build process using Bitbake
echo "Starting the build for $IMAGE..."
bitbake $IMAGE

# Step 6: Display message after build completion
if [ $? -eq 0 ]; then
    echo "Build completed successfully!"
else
    echo "Build failed. Check the logs for more details."
    exit 1
fi

