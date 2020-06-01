
###

$ docker network create --gateway 172.20.0.1 --subnet 172.20.0.0/24 ottertune-net
$ docker-compose -f docker-compose.up.yml up

#### switch to docker folder
$ cd ottertune/docker

#### build all basic images
$ docker-compose -f docker-compose.build.yml build

#### to test
#export dcfile_postgres=docker-compose.postgresql.yml
export dcfile_postgres=docker-compose.mysql.yml
BACKEND=mysql WEB_ENTRYPOINT="''" sh create-docker-compose.sh $dcfile_postgres
docker-compose -f $dcfile_postgres run --workdir="/app" --no-deps --rm web bash -c "pip3 freeze"

##### 
docker-compose -f $dcfile_postgres run --workdir="/app/controller" --no-deps --rm driver gradle build

##### unit test
docker-compose -f $dcfile_postgres run --workdir="/app" --no-deps --rm web bash -c "python3 -m unittest discover -s analysis/tests -v"

##### integration test
docker-compose -f $dcfile_postgres run --rm web bash -c "sed -i 's/CHECK_CELERY = True/CHECK_CELERY = False/' website/settings/constants.py && ./wait-for-it.sh && python3 manage.py makemigrations website && python3 manage.py test --noinput -v 2"


#### to start 
docker-compose -f docker-compose.up.yml up -d

#### web login
http://localhost:8000/login/

#### install tools for postgres:9.6 and rabittmq
apt update && apt install -y net-tools iputils-ping procps


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

cd $ROOT/docker

docker-compose -f docker-compose.build.yml build --build-arg GIT_COMMIT=$TRAVIS_COMMIT

export dcfile_postgres=docker-compose.postgresql.yml

export dcfile_postgres=docker-compose.mysql.yml


BACKEND=mysql WEB_ENTRYPOINT="''" sh create-docker-compose.sh $dcfile_postgres


docker-compose -f $dcfile_postgres run --workdir="/app" --no-deps --rm web bash -c "pip3 freeze"

docker-compose -f $dcfile_postgres run --workdir="/app/controller" --no-deps --rm driver gradle build

docker-compose -f $dcfile_postgres run --workdir="/app" --no-deps --rm web bash -c "python3 -m unittest discover -s analysis/tests -v"

docker-compose -f $dcfile_postgres run --rm web bash -c "sed -i 's/CHECK_CELERY = True/CHECK_CELERY = False/' website/settings/constants.py && ./wait-for-it.sh && python3 manage.py makemigrations website && python3 manage.py test --noinput -v 2"

===
docker-compose -f $dcfile_postgres run --workdir="/app/controller" --no-deps driver gradle build
 working_dir: /app/driver

docker-compose -f $dcfile_postgres run --workdir="/app/driver " --no-deps driver gradle build


cd4e1ead62b917a3c2879cc05a30ff443a59dc50

docker-compose -f docker-compose.up.yml run --workdir="/app" --no-deps --rm web bash -c "pip3 freeze"

docker-compose -f docker-compose.up.yml up -d

http://localhost:8000/login/


docker run -it --network=docker_ottertune-net ottertune-driver bash

==============
vim /app/oltpbench/config/tpcc_config_postgres.xml
    <dbtype>postgres</dbtype>
    <driver>org.postgresql.Driver</driver>
    <DBUrl>jdbc:postgresql://172.20.0.3:5432/postgres</DBUrl>
    <username>postgres</username>
    <password>postgres</password>
===============
vim
#==========================================================
#  DATABASE OPTIONS
#==========================================================

# Postgres, Oracle or Mysql
DB_TYPE = 'postgres'

# Database version
DB_VERSION = '9.6'

# Name of the database
DB_NAME = 'postgres'

# Database username
DB_USER = 'postgres'

# Password for DB_USER
DB_PASSWORD = 'postgres'

# Database admin username (for tasks like restarting the database)
ADMIN_USER = DB_USER

# Database host address
DB_HOST = '127.0.0.1'

# Database port
DB_PORT = '5432'
....
DB_CONF = '/var/lib/postgresql/data/postgresql.conf'
...
PG_DATADIR = '/var/lib/postgresql/data'
...
OLTPBENCH_HOME = os.path.expanduser('/app/oltpbench')
...
# OtterTune website URL
WEBSITE_URL = 'http://172.20.0.5:8000'

# Code for uploading new results to the website
UPLOAD_CODE = 'I5I10PXK3PK27FM86YYS'

===== test
./oltpbenchmark -b tpcc -c config/tpcc_config_postgres.xml --create=true --load=true



====


/app/oltpbench


https://github.com/bohanjason/ottertune-example-data


# Path to OLTPBench directory
OLTPBENCH_HOME = os.path.expanduser('~/oltpbench')

# Path to the OLTPBench configuration file
OLTPBENCH_CONFIG = os.path.join(OLTPBENCH_HOME, 'config/tpcc_config_postgres.xml')

# Name of the benchmark to run
OLTPBENCH_BENCH = 'tpcc'


# OtterTune website URL
WEBSITE_URL = 'http://127.0.0.1:8000'

# Code for uploading new results to the website
UPLOAD_CODE = 'I5I10PXK3PK27FM86YYS'






Algorithm:
    Gaussian Process Bandits                *
    Deep Deterministic Policy Gradients
    Deep Neural Network

Session type
    Tuning Session                          *
    No Tuning
    Randomly Generate
    Run LHS

Target objective
    Custom DB Time(s)
    Normalized DB Time(s)
    Elapsed Time(s)
    udf.latency_99(us)
    Raw DB Time(s)
    udf.throughput(txn/s)
    Throughput (txn/sec)                    *
    Number of commits and roolbacks(txn)




docker save myimage:latest | gzip > myimage_latest.tar.gz
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
