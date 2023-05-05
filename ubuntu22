FROM ubuntu:22.04 as build
RUN apt-get update && apt-get install -y autoconf automake curl cmake git libtool make \
    && git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd \
    && cd /ttyd && env BUILD_TARGET=x86_64 ./scripts/cross-build.sh

FROM ubuntu:22.04

COPY --from=build /ttyd/build/ttyd /usr/bin/ttyd
RUN apt update && apt install bash vim nano  tini -y
RUN useradd -ms /bin/bash cli
USER cli
WORKDIR /home/cli
EXPOSE 7681
WORKDIR /root

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["ttyd", "bash"]
