FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update

RUN apt-get install -y git ssh cmake libboost-all-dev guile-3.0-dev cython gdb vim guile-3.0

#Install cogutil 

RUN cd /tmp && git clone https://github.com/opencog/cogutil.git && \
        cd cogutil && \
        mkdir build && \
        cd build && \
        cmake .. && \
        make -j4 && \
        make install && \
        ldconfig /usr/local/lib/opencog

#Install atomspace
RUN cd /tmp && git clone https://github.com/opencog/atomspace.git && \
    cd atomspace && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    ldconfig /usr/local/lib/opencog

#Install URE
RUN cd /tmp && git clone https://github.com/opencog/ure.git && \
    cd ure && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    ldconfig /usr/local/lib/opencog


#Install pattern miner
RUN cd /tmp && git clone https://github.com/opencog/miner.git && \
    cd miner && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    ldconfig /usr/local/lib/opencog

#Install agi-bio
RUN cd /tmp && git clone https://github.com/opencog/agi-bio.git && \
    cd agi-bio && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    ldconfig /usr/local/lib/opencog

#Install pln
RUN cd /tmp && git clone https://github.com/opencog/pln.git && \
    cd pln &&  \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    ldconfig /usr/local/lib/opencog

WORKDIR /opt