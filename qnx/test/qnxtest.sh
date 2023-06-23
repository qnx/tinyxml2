#! /bin/sh

# For testing, copy the whole tinyxml2 compiled source tree to the target in
# a specific location e.g. /data/tinyxml2 and then execute this script from
# the source tree

# Move resources folder to the test directory
cp -rf ../../resources ../build/${TINYXML2_TEST_PREFIX}/build

# Change directory to the test directory
cd ../build/${TINYXML2_TEST_PREFIX}/build;

# Set LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/tinyxml2/qnx/build/${TINYXML2_TEST_PREFIX}/build

# Create a symbolic link, libtinyxml.so.9, to libtinyxml.so.9.0.0
# For some reason, libtinyxml.so.9 is not picked up by mkqnximage
ln -sf libtinyxml2.so.9.0.0 libtinyxml2.so.9

# Run the test
./xmltest
