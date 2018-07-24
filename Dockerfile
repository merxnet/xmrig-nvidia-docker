ARG CUDA_VERSION=9.2
ARG BUILD_FLAVOR=devel
ARG RUN_FLAVOR=base
ARG DISTRO=ubuntu18.04

FROM nvidia/cuda:${CUDA_VERSION}-${BUILD_FLAVOR}-${DISTRO} AS build

ENV CMAKE_OPTS='-DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7 -DWITH_AEON=OFF -DWITH_HTTPD=OFF'

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install git build-essential cmake libuv1-dev libmicrohttpd-dev

RUN git clone https://github.com/xmrig/xmrig-nvidia.git
RUN cd xmrig-nvidia && git checkout $(git describe --abbrev=0 --tags --exclude *-beta) && mkdir build

WORKDIR xmrig-nvidia/build
RUN cmake .. -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda ${CMAKE_OPTS} && make


FROM nvidia/cuda:${CUDA_VERSION}-${RUN_FLAVOR}-${DISTRO}

LABEL maintainer='docker@merxnet.io'

COPY --from=build /xmrig-nvidia/build/xmrig-nvidia /usr/local/bin/xmrig-nvidia

ENTRYPOINT ["xmrig-nvidia"]
