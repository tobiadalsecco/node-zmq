FROM node:4.1.2

RUN apt-get update -y && apt-get install -y libtool autoconf automake make g++ uuid-dev wget

WORKDIR /tmp
RUN wget http://download.zeromq.org/zeromq-4.1.3.tar.gz && tar -xvf zeromq-4.1.3.tar.gz && cd zeromq-* && ./configure --without-libsodium && make install && ldconfig && cd .. && rm -rf zeromq*

RUN apt-get remove -y libtool autoconf automake make g++ uuid-dev wget
RUN apt-get purge libtool autoconf automake make g++ uuid-dev wget
RUN apt-get autoclean

WORKDIR /data
