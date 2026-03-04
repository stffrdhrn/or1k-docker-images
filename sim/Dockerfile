FROM or1k-base-stripped:latest

RUN apt-get update && apt-get install -y \
 libreadline8 \
 curl \
 xz-utils \
 && rm -rf /var/lib/apt/lists/*

ARG OR1KSIM_VERSION=2025-04-27
RUN mkdir -p /opt/or1k \
  && cd /opt/or1k \
  && curl --remote-name --location \
    https://github.com/openrisc/or1ksim/releases/download/${OR1KSIM_VERSION}/or1ksim-${OR1KSIM_VERSION}.tar.gz \
  && tar -xf or1ksim-${OR1KSIM_VERSION}.tar.gz \
  && mv /opt/or1k/or1k /opt/or1k/or1ksim \
  && rm /opt/or1k/*.tar.*

COPY sim.cfg /opt/or1k/

ENV PATH "$PATH:/opt/or1k/or1ksim/bin"
RUN or1k-elf-sim --version || true

WORKDIR /tmp

LABEL maintainer Stafford Horne <shorne@gmail.com>
