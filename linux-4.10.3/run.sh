#
echo "cp ../config .config"
cp ../config .config
echo "make -j$(cat /proc/cpuinfo | grep proc | wc -l)"
(while true; do IFS=$'\n' ps_result=($(ps -C gcc -o pid=,%mem=,vsz=)); printf "$(date '+%s.%N') %s\n" "${ps_result[@]}" >> pss.log; done) &
perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses ./clean_n_run.sh 2> stat
kill $!
cat pss.log | grep -v ' $' > ps.log
rm pss.log
perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses -r 2 ./clean_n_run.sh 2>> stat
