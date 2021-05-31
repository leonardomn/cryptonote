FROM ubuntu:14.04 as builder
ARG THREADS=1
WORKDIR /opt/uhc

RUN apt update -y && apt install cmake build-essential g++ git python-dev autotools-dev libicu-dev libbz2-dev wget -y
RUN wget -O boost_1_55_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz/download
RUN tar xzvf boost_1_55_0.tar.gz > /dev/null && \
	cd boost_1_55_0/ && \
	./bootstrap.sh --prefix=/usr/local && \
	./b2 --with=all -j $THREADS install
RUN sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf' && ldconfig
COPY . /opt/uhc/
RUN ln -s /usr/bin/make /usr/bin/gmake
RUN make -j $THREADS


FROM debian:buster-slim
WORKDIR /opt/uhc

COPY --from=builder /usr/local/lib /usr/local/lib
RUN sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf' && ldconfig

RUN groupadd -r uhc && useradd --create-home --shell /bin/bash --no-log-init -r -g uhc uhc
RUN chown uhc:uhc -R /opt/uhc
COPY --from=builder /opt/uhc/build/release/src/uhcd /opt/uhc/.
COPY --from=builder /opt/uhc/build/release/src/miner /opt/uhc/.
COPY --from=builder /opt/uhc/build/release/src/walletd /opt/uhc/.
COPY --from=builder /opt/uhc/build/release/src/simplewallet /opt/uhc/.
COPY --from=builder /opt/uhc/build/release/src/connectivity_tool /opt/uhc/.

USER uhc
EXPOSE 42000
ENTRYPOINT ["/opt/uhc/uhcd"]
