# Copia o arquivo de configuração correto
echo "cp ../config .config"
cp ../config .config

# Apaga versões anteriores das saídas dos programas
echo "rm -f stat ps.log"
rm -f stat ps.log

# Utiliza o ps para medir a memória e páginas físicas, imprimindo em um
# arquivo os resultados das medidas enquanto o perf e a compilação rodam
echo "(while true; do IFS=$'\n' ps_result=($(ps -C gcc -o pid=,%mem=,vsz=)); printf "$(date '+%s.%N') %s\n" "${ps_result[@]}" >> pss.log; done) &"
(while true; do IFS=$'\n' ps_result=($(ps -C gcc -o pid=,%mem=,vsz=)); printf "$(date '+%s.%N') %s\n" "${ps_result[@]}" >> pss.log; done) &

# Inicializa o perf para calcular os parâmetros desejados para o benchmark
# enquanto roda o ps para medir o desempenho do disco na primeira vez
echo "perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses ./clean_n_run.sh 2> stat"
perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses ./clean_n_run.sh 2> stat

# Mata o processo do ps que estava rodando para medir o desempenho do disco
echo "kill $!"
kill $!

# Edita o arquivo de saída do ps para apagar linhas sem os valores desejados
echo "cat pss.log | grep -v ' $' > ps.log"
cat pss.log | grep -v ' $' > ps.log

# Apaga o arquivo auxiliar do ps
echo "rm pss.log"
rm pss.log

# Usa o perf novamente para calcular os parâmetros para 4 compilações
echo "perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses -r 4 ./clean_n_run.sh 2>> stat"
perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses -r 4 ./clean_n_run.sh 2>> stat

# Calcula a média da memória virtual
python avg.py ps.log >> stat

# Mostra os resultados
python score.py stat
