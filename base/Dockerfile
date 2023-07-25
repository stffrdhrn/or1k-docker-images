FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
 curl

RUN groupadd -g 998 or1kuser && \
    useradd -m -u 998 -g or1kuser or1kuser

ENV OE_TOOLCHAIN=ubuntu2204-gcc13.1.0
RUN mkdir -p /opt/or1k \
  && cd /opt/or1k \
  && curl --remote-name --location \
    https://buildbot.embecosm.com/job/or1k-gcc-ubuntu2204-release/5/artifact/or1k-embecosm-${OE_TOOLCHAIN}.tar.gz \
  && tar -xf or1k-embecosm-${OE_TOOLCHAIN}.tar.gz \
  && rm /opt/or1k/*.tar.*

ENV PATH "$PATH:/opt/or1k/or1k-embecosm-${OE_TOOLCHAIN}/bin"
