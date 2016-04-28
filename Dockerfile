FROM node:4.1.2

RUN apt-get update -y && apt-get install -y libtool autoconf automake make g++ uuid-dev wget

WORKDIR /tmp
RUN wget http://download.zeromq.org/zeromq-4.1.3.tar.gz && tar -xvf zeromq-4.1.3.tar.gz && cd zeromq-* && ./configure --without-libsodium && make install && ldconfig && cd .. && rm -rf zeromq*

WORKDIR /data

RUN npm init --yes

RUN npm install microservices-layer
RUN npm install hiredis
