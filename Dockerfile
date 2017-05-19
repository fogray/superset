FROM ubuntu:14.04

#WORKDIR /usr/src/app

RUN apt-get -y install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev

#RUN pip install virtualenv

WORKDIR /root
RUN pip install --upgrade setuptools pip && pip install superset

WORKDIR /root/venv/bin
RUN ls
RUN ./fabmanager create-admin --username admin --firstname admin --lastname admin --email 222@qq.com  --password admin --app superset

RUN ./superset db upgrade

RUN ./superset load_examples
RUN ./superset init
