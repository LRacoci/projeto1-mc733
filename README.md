
# Programa 4 - Compilação do Kernel do Linux utilizando o GNU GCC
## O quefaz? Para que serve?
O GNU GCC é um programa que transforma programas em linguagem C ou C++ em executáveis para serem rodados na máquina onde está sendo compilado. O Kernel do Linux é o núcleo deste sistema operacional com as syscalls básicas do sistema e faz o gerenciamento de periféricos e memória ou disco.
## Por que é bom para medir desempenho?
Devido a grande quantidade de código envolvida no Kernel, o compilador possui muito trabalho para ser realizado, sendo possível medir o desempenho da CPU e cache, e também do disco pois possui muitas leituras e escritas de arquivos.
## O que baixar
Para baixar os arquivos para realizar o benchmark, é preciso clonar este repositório [aqui](https://github.com/LRacoci/projeto1-mc733)
## Como compilar/instalar
Como o benchmark se trata de compilar o Kernel do Linux, não é preciso compilar nem instalar nada anteriormente, só possuir as Development Tools do Linux.
## Como executar
Para executar o benchmark, é necessário entrar no diretório linux-4.10.3 e executar o seguinte comando:

	$ ./run.sh

## Como medir o desempenho
Como que o desempenho é medido através deste programa? Se for através de tempo, você deve especificar claramente qual tempo deverá ser utilizado e indicar o motivo aqui. Quantas vezes a medida deverá ser feita? O que fazer com ela (média, etc) ? Não especificar o tempo será considerado falha grave.
## Como apresentar o desempenho
Como o desempenho deverá ser mostrado. Margem de erro, etc.
## Medições base (uma máquina)
Inclua a especificação dos componentes relevantes e os resultados de desempenho.
