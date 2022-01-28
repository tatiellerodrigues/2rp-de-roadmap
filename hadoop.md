Treinamento2rp.net
Fundamentos Hadoop
_____________________________

Hadoop um (ecosystem Hdfs-hadoop distributed file system) ferramenta de codigo aberto. E uma 
ferramenta open-source inspirada no GFS (Google file system) com armazenamento e processamento
distribuido em grandes conjuntos entre clusters de computadores
 * Armmazena diferente dados como :
Semi-estruturados
Não-estruturados
Estrurados

Vantagem : tolerancia a falhas .confiabilidade fornecida pela geração de copias de dados
Desvantagem :Uso de pequenos arquivo no HDFS pode causar problemas de memoria NameNode pois o numero de processamento
pode sobrecarregar 

Componentes o framework e formado por dois componentes principais são eles:
HDFS NAMENODE : Nó principal no cluster  que contém metadados  para todos os arquivos e diretorios da árvore no HDFS
HDFS DATANODE: Nó escravo , são respomsavel por armazenar e recuperar blocos instruidos pelo nomeNode

Yarn e  (gerenciador de recursos ) I em cluster , ela permite que empresa faz o processamento de dados simultaneamente de varias formas
com sua funcionalidade escalavel tolerante falhas 
Porque motivo a mtivo uso do YARN e IMPORTANTE
	
Limitação Mapreduce 
---------------------------------
- Escabilidade 4.000 nos por cluster
-Quantidade tarefas e aproximadamente concorrentes 40.000

COMPONENTES: 
--------------------
Resource Manger: Aloca para aplicativos em execução yarn

NodeManager: roda em cada nó do cluster 

AplicationManger: Responsavel pelor recursos com resourge manager e por trabalhar com os NodeManagers

Pig Latin
-----------   
pig runtime desenvilvido em  linguagem para  ambiente de execução  foi desenvolvido pelo Facebook em SQL,
 por isso ela tem a semelhantes a SQL HQL: HIVE + SQL

Copilador converte oig em mapreduce.
Fonce plataforma para construção de fluxo ETL para processamento de analise  Apache HIVE

Componentes:
Armazena dados de leitura , gravaçãoes gerenciamento no grande conjuntos de dados 
Utilização de  SQL HQL: HIVE + SQL
   *Processamento de consulta 
	*altamentamente escalonavel	
	*poecessamento em tempo real 

Suporta todos os tipos de dados primitivos SQL COMPONENTES
Linha de comando: execução
JDBC(JAVA)/ODBC(OBJECT): Conexão do armazenamento MAHOUT

Ambiente para criação de aplicativos de machine learning escalonáveis que faz filtragem corporativo( Análise comportamentos )de usuários - Previsão - Faz recomendações ex: site de comércio CLUSTERING - Organiza e agrupa dados semelhantes CLASSIFICAÇÃO - Classifica e categoriza os dados em subdepartamentos CONJUNTO DE ITENS FREQUENTES AUSENTES - Verifica quais objetos aparecem juntos - Faz sugestões, se tiverem ausentes APACHE SPARK
Estrutura para a análise de dados em tempo real
Ambiente de computação distribuído
Executa cálculos na memória para aumentar a velocidade de processamento do Map-Reduce
Suporta R, SQL, PYTHON, SCALA, JAVA, ETC. APACHE HBASE
Banco de dados distribuído
Não relacional
Código aberto
Suporte a todos os tipos de dados
Tolerante a falhas
JAVA
Recuperar pequena quantidade de dados de grandes conjuntos de dados APACHE DRILL
Análise de grandes conjuntos de dados
Réplica d Google Dremel
Fornece escalabilidade para processar petabytes e exabytes de dados de forma eficiente FUNCIONALIDADES
Combinação de uma variedade de armazenamento de dados usando apenas uma única consulta APACHE ZOOKEEPER
Coordenador de qualquer trabalho do Hadoop
Vários serviços em um sistema distribuído APACHE OOZIE
Serviço de relógio e alarme
Planejador FLUXO DE TRABALHO
Conjunto sequencial de ações a serem executadas
Como uma corridad de revezamento COORDENADOR
Trabalhos que são acionados quando os dados são disponibilizados APACHE FLUME
Ingestão de dados não-estruturados/semi-estruturados HDFS
Solução confiável e distribuída
Ajuda na coleta e movimentação de grandes conjuntos de dados de diversas fontes COMPONENTES FONT: Aceita os dados da linha de entrada e armazena no channel CHANNEL: Armazenamento temporário entre a fonte de dados e os dados do HDFS SINK: Coleta os dados APACHE SQOOP -Ingestão de dados não-estruturados, semi-estruturados/estruturados MAPTASK
Subtarefa que importa parte dos dados para Hadoop APACHE SOLR & LUCENE
Pesquisa e indexação LUCENE
JAVA
Núcleo SOLR -Aplicativo desenvolvido em torno do lucene Utiliza a biblioteca de pesquisa lucene para pesquisa e indexação APACHE AMBARI
Torna o Hadoop mais gerenciável PROVISIONAMENTO DE CLUSTER
Fornece passo a passo para instalar serviços Hadoop
Faz a configuração de serviços em um cluster GERENCIAMENTO DE CLUSTER
Fornece serviço de gerenciamento central para iniciar, interromper e reconfigurar serviços Hadoop MONITORAMENTO DE CLUSTER
Monitorar a saúde e status
Fornece um painel FRAMEWORK AMBER ALERT
Serviço de alerta de acordo com a necessidade

   HADOOP ARCHITETURE ARQUITETURA HDFS
-----------------------------------------------------------
 E um Sistema de arquivos estruturados em blocos, cada arquivo é dividido em blocos de tamanho pré-determinadoOs blocos são armazenados em um cluster de uma ou várias máquinas
Segue uma arquitetura "mestre-escravo" em que um cluster é composto por um único NameNode e todos os outros nós são DataNodes NAMENODE
Nó mestre
Mantém e gerencia os blocos presentes nos DataNodes (nós-escravos)
Controla o acesso dos clientes aos arquivos
Os dados residem apenas no DataNodes FUNÇÕES 
I) Mantém e gerencia DataNodes II) Registra os metadados de todos os arquivos armazenados no cluster ARQUIVOS ASSOCIADOS AOS METADADOS - FSIMAGE: Contém o estado completo do namespace do sistema de arquivos - EDITLOGS: Contém todas as modificações recentes feitas no sistema de arquivos em relação ao FSIMAGE mais recente III) Registra cada mudança que ocorre nos metadados IV) Recebe regularmente um heartbeat e um relatório de bloco de todos os DataNodes V) Cuidar do fator de replicação VI) No caso de falha do DataNode, o NameNode escolhe novos DataNodes para novas réplicas, equilibra o uso do disco e gerencia o trafego de comunicação para os DataNodes DATANODE
Nó escravo
Hardware
Servidor de bloco que armazena os dados no arquivo local ext3 ou ext4
 FUNÇÕES I) Armazenamento dos dados reais II) Executam as solicitações de leitura e gravação de baixo nível
dos clientes do sistema de arquivos III) Enviam pulsações ao NameNode periodicamente(3s) para relatar a integridade 
geral do HDFS NAMENODE SECUNDÁRIO
Funciona simultaneamente com o NameNode
Auxiliar FUNÇÕES I) Lê sistemas de arquivo e metadados da RAM do NameNode e os grava no disco rígido ou no sistema de arquivos II) Combinar EditLogs com FSIMAGE do NameNode III) Baixa os EditLogs do NameNode em intervalos regulares e se aplica ao FsImage é copiado de volta para o NameNode, que é usado sempre que o NameNOde é iniciado BLOCOS
Menor local contínuo em disco rígido onde os dados são armazenados
Tamanho padrão: 128MB
Não é necessário ser múltiplos exatos GERENCIAMENTO DE REPLICAÇÃO
Tolerância a falhas
Fator de replicação padrão: 3
Cada bloco é replicado 3x e armazenado em diferentes DataNodes CONSCIENTIZAÇÃO DE RACK
O NameNode garante que todas as réplicas não sejam armazenadas no mesmo rack
Redução de latência e tolerância a falhas
A primeira réplica será armazenada em um rack local e as outras 2 em um rack remoto VANTAGENS
Melhor desempenho da redeEvitar perda de dados ARQUITETURA DE LEITURA E GRAVAÇÃO
Filosofia Write Once-Read Many
Não se pode editar arquivos já armazenados mas pode acrescentar novos dados abrindo novamente o arquivo GRAVAÇÃO
NameNode concederá ao cliente a permissão de gravação e fornecerá os IPs dos DataNodes


Etapas:
Configuração do pipeline
Streaming e replicação de dados
Desligamento do pipeline CONFIGURAÇÃO DO PIPELINE
Antes de gravar os blocos, o cliente confirma se os DataNodes, presentes nas listas estão prontos para receber os dados
É criado por um pipeline, para cada bloco conectando os DataNodes individuais na lista desse bloco ETAPAS CRIAÇÃO
O cliente escolhe o primeiro DataNode da lista
O cliente informa o DataNode1 para estar pronto para receber o bloco
O DataNode1 se conecta ao DataNode4. O DN1 informa o DN4 para estar pronto e da o IP do 6, então dirá ao 6, etc.
O reconhecimento segue sequência inversa 6 -> 4 -> 1 -> cliente

o cliente
Inicia o processo de streaming STREAMING DE DADOS
Envio de dados para o pipeline
Replicação de dados com base no fator 3 ETAPAS REPLICADO
Depois que o bloco foi gravado no DN1 pelo cliente, o DN1 se conectará ao DN4
DN1 enviará o bloco no pipeline e os dados serão copiados para o DN4
DN4 se conectará ao DN6 e copiará a ultima replica do bloco ENCERRAMENTO DO PIPELINE/RECONHECIMENTO
Uma série de reconhecimento ocorrerá para garantir ao cliente e NameNode que os dados foram gravados com sucesso
A configuração ocorre na sequencia inversa
O DN enviará 3 confirmações para o pipeline e as enviará ao cliente
O cliente informará NameNode que os dados foram gravados
O NameNode atualização seus metadados
Cliente desligará o pipeline LEITURA

Etapas
 O cliente solicita os metadados do bloco depois  NameNode retorna a lista de DataNodes e por fim O Namenode 
se conecta ao DataNode

Cliente lê os dados e forma o arquivo

UDEMY - REAL WORLD HADOOP - HANDS ON ENTERPRISE DISTRIBUTED STORAGE CRIANDO UM ESPAÇO DE USUÁRIO 