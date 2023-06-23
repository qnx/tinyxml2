# Testing tinyxml2 on QNX

tinyxml2 normally wants to be tested on the same machine it was built on. This obviously doesn't work when cross-compiling for QNX. The gist is to build, then copy the whole tinyxml2 source tree on a target. This will include all the relevant files and directory structure which tinyxml2 expects when running its test suite.

# Running the Test Suite
Compile the tinyxml2 source for the desired architecture, e.g.

    OSLIST=nto CPULIST=x86_64 make -C qnx/build install

Then build your QNX image using mkqnximage and the following options:

    # <repo_path> is where the code was checked out e.g. /mnt/dev/tinyxml2
    mkdir test_image
    cd test_image
    mkqnximage --extra-dirs=<repo_path>/qnx/test/mkqnximage --clean --run --force --test-tinyxml2=<repo_path>

Once the target has booted, the tinyxml2 source tree will be located in /data/tinyxml2:

    # cd /data/tinyxml2/qnx/test
    # ./qnxtest.sh
    ...
    Parsing dream.xml (Release): 744.000 milli-seconds

    Pass 463, Fail 0
    ...
