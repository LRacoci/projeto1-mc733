#
echo "cp ../config .config"
cp ../config .config
echo "make clean"
make clean
echo "make -j$(cat /proc/cpuinfo | grep proc | wc -l)"
make -j$(cat /proc/cpuinfo | grep proc | wc -l)
