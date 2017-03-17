
# Programa 4 - Compilação do Kernel do Linux utilizando o GNU GCC
## O quefaz? Para que serve?
O GNU GCC é um programa que transforma programas em linguagem C ou C++ em executáveis para serem rodados na máquina onde está sendo compilado. O Kernel do Linux é o núcleo deste sistema operacional com as syscalls básicas do sistema e faz o gerenciamento de periféricos e memória ou disco.
## Por que é bom para medir desempenho?
Devido a grande quantidade de código envolvida no Kernel, o compilador possui muito trabalho para ser realizado, sendo possível medir o desempenho da CPU e cache, e também do disco pois possui muitas leituras e escritas de arquivos.
## O que baixar
Para baixar os arquivos para realizar o benchmark, é preciso clonar este repositório [aqui](https://github.com/LRacoci/projeto1-mc733). Se for utilizar os computadores do IC-3 para realizar o benchmark, clone o repositório no diretório /tmp/ para não exceder a quota pessoal do usuário.
## Como compilar/instalar
Como o benchmark se trata de compilar o Kernel do Linux, não é preciso compilar nem instalar nada anteriormente, só possuir as Development Tools do Linux.
## Como executar
Para executar o benchmark, é necessário entrar no diretório linux-4.10.3 e executar o seguinte comando:

	$ ./run.sh

Este script foi preparado para que todos os comandos necessários para o benchmark já fossem executados, mas é possível executar passo a passo também.
## Como medir o desempenho
Para medir o desempenho, foram utilizados os seguintes comandos:

	$ (while true; do IFS=$'\n' ps_result=($(ps -C gcc -o pid=,%mem=,sz=)); printf "$(date '+%s.%N') %s\n" "${ps_result[@]}" >> pss.log; done) &

Este comando inicializa o ps para rodar no background e vai colocando os valores das medidas de memória e das páginas físicas em um arquivo de saída. Ele foi utilizado em conjunto com:

	$ perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses ./clean_n_run.sh 2> stat

Este comando roda o perf e calcula os parâmetros relevantes para o benchmark. Esta é a primeira vez que a compilação ocorre, então os arquivos ainda não foram lidos para a memória, e este tempo é mais lento. O perf é rodado uma segunda vez para compilar o Kernel 4 vezes e ter tempos com os arquivos (ou a maioria) já carregado na memória. Então o processo do ps é parado, e o arquivo de saída é editado e o perf é rodado novamente:

	$ kill $!
	$ cat pss.log | grep -v ' $' > ps.log
	$ rm pss.log
	$ perf stat -d -e cycles,bus-cycles,major-faults,minor-faults,branches,branch-misses,cpu-clock,cache-references,cache-misses -r 4 ./clean_n_run.sh 2>> stat

A cada vez que o Kernel é recompilado, é dado um clean para limpar os arquivos antigos. 

Como que o desempenho é medido através deste programa? Se for através de tempo, você deve especificar claramente qual tempo deverá ser utilizado e indicar o motivo aqui. Quantas vezes a medida deverá ser feita? O que fazer com ela (média, etc) ? Não especificar o tempo será considerado falha grave.
## Como apresentar o desempenho
Como o desempenho deverá ser mostrado. Margem de erro, etc.
## Medições base (uma máquina)
Inclua a especificação dos componentes relevantes e os resultados de desempenho.
