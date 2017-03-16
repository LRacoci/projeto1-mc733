make clean
make -j$(cat /proc/cpuinfo | grep proc |wc -l)
