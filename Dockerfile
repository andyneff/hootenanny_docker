FROM krallin/ubuntu-tini:14.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git wget supervisor

RUN useradd -m vagrant && \
    echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER vagrant

RUN git clone --recursive https://github.com/ngageoint/hootenanny.git /home/vagrant/hoot && \
    cd /home/vagrant/hoot && \
    git checkout 1da167cd4d928837171b412316383d21eeead3cd && \
    git submodule update

RUN sed -i 's:\(postgresql-contrib-9\.1\):\1\nsudo sed -i '"'"'s\|5433\|5432\|'"'"' /etc/postgresql/9.1/main/postgresql.conf; sudo service postgresql restart:' /home/vagrant/hoot/VagrantProvision.sh

RUN bash /home/vagrant/hoot/VagrantProvision.sh

RUN sudo chown -R :tomcat6 /home/vagrant/hoot && \
    sudo chmod -R 775 /home/vagrant/hoot

ADD postgresql-entrypoint.sh mapnik-entrypoint.sh tomcat6-entrypoint.sh supervisord.conf /

EXPOSE 8080 8094 8096 8888

CMD sudo supervisord -c /supervisord.conf
