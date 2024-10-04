# BeagleBone Yocto Project (Kirkstone)

This repository contains files and scripts necessary to build a minimal Yocto image (`core-image-minimal`) for the BeagleBone using the Yocto Project **Kirkstone** version. The image has been customized to include the **GCC compiler**, **GCC symlinks**, and **Make** utility, which are useful for development purposes directly on the target device.

## Repository Structure

- **conf/**
  - **bblayers.conf**: Configuration file listing the metadata layers included in your build.
  - **local.conf**: Defines your local build settings (machine, image type, etc.).
  - **layer.conf**: Contains metadata about your layer.

- **build_yocto.sh**: A bash script to automate the setup and build process for the Yocto environment, including environment setup, configuration, and image building.

## Prerequisites

Before running the build, ensure you have installed the necessary **host packages**. Follow the instructions for your distribution from the official 🔗 [Yocto Project Quick Build Guide](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html).

## Automated Build Script

The `build_yocto.sh` script simplifies the entire build process. It clones the necessary Yocto repositories, configures the environment for BeagleBone, and builds the `core-image-minimal` with additional customization to include the GCC compiler, GCC symlinks, and Make utility.

### Script Usage

1. Make the script executable:
   ```bash
   chmod +x build_yocto.sh

2. Run the script
    ```bash
    ./build_yocto.sh

This script will:
- Clone the Poky repository for Yocto.
- Set up the environment.
- Configure the build for the BeagleBone.
- Start the build process using bitbake.

## Variables in the Script

- **YOCTO_VERSION**: Specifies the Yocto version (kirkstone).
- **BUILD_DIR**: Directory for Yocto build files (bbb_build).
- **MACHINE**: Target machine (beaglebone).
- **IMAGE**: Image to be built (core-image-minimal).

## Customizing the Image with GCC, GCC Symlinks, and Make

In addition to building the default core-image-minimal, this project includes the GCC compiler, GCC symlinks, and Make utility in the image. These tools enable developers to compile and build applications directly on the BeagleBone device.

This customization was made by modifying the `local.conf` file to include the following:

  ```bash
       IMAGE_INSTALL:append = " gcc gcc-symlinks make"
   ```

After running the script, the build will take place in the bbb_build directory, and the resulting image will include the GCC compiler.

## Customizing the Build

To customize the build further, you can modify the following in conf/local.conf:

- MACHINE: Change the target hardware if required.
- IMAGE: Modify the image type to core-image-sato or other pre-configured images.
- Additional Packages: Add more packages as needed by appending to the IMAGE_INSTALL variable.

## Repository Contents

- conf/: Holds configuration files necessary before the build starts.
- build_yocto.sh: The bash script that automates the build process.
- GCC Integration: The GCC compiler has been integrated into the image for on-device development.

## References 🌐

- [Yocto Project Documentation](https://docs.yoctoproject.org/)
- [BeagleBone Support in Yocto](https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#_beaglebone)
- [Adding Host Packages](https://docs.yoctoproject.org/brief-yoctoprojectqs/yocto-project-quick-build-guide.html#adding-host-packages)
- For more detailed hardware specifications and documentation, refer to the [BeagleBone Black Documentation](https://docs.beagleboard.org/boards/beaglebone/black/ch03.html).

