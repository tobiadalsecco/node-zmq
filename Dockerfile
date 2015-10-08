FROM node:0.12

RUN apt-get update -y && apt-get install -y libtool autoconf automake make g++ uuid-dev wget

WORKDIR /tmp
RUN wget http://download.zeromq.org/zeromq-4.0.5.tar.gz && tar -xvf zeromq-4.0.5.tar.gz && cd zeromq-* && ./configure && make install && ldconfig && cd .. && rm -rf zeromq*

RUN npm install -g pm2

WORKDIR /data