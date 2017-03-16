#
echo "cp ../config .config"
cp ../config .config
echo "make clean"
make clean
echo "make -j$(cat /proc/cpuinfo | grep proc | wc -l)"
perf stat -d make -j$(cat /proc/cpuinfo | grep proc | wc -l) 2> stat
perf stat -d -r 2 make -j$(cat /proc/cpuinfo | grep proc | wc -l) 2>> stat
