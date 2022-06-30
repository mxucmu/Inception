FROM    debian:buster

RUN     apt-get update && \
        apt-get upgrade && \
        apt-get -y install software-properties-common dirmngr apt-transport-https 

RUN     apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' && \
        add-apt-repository 'deb [arch=amd64,arm64,ppc64el] https://mirror.23m.com/mariadb/repo/10.6/debian buster main'

RUN     apt-get update && \
        apt-get install -y mariadb-server mariadb-client

COPY    init/*.sql      /tmp/
COPY    start.sh        .
RUN     chmod +x start.sh 

CMD     ["./start.sh"]
