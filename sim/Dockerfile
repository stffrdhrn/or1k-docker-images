FROM or1k-base:latest

RUN apt-get update && apt-get install -y \
 libreadline8

ENV OR1KSIM=2023-07-23
RUN mkdir -p /opt/or1k \
  && cd /opt/or1k \
  && curl --remote-name --location \
    https://github.com/openrisc/or1ksim/releases/download/${OR1KSIM}/or1ksim-${OR1KSIM}.tar.gz \
  && tar -xf or1ksim-${OR1KSIM}.tar.gz \
  && mv /opt/or1k/or1k /opt/or1k/or1ksim \
  && rm /opt/or1k/*.tar.*

COPY sim.cfg /opt/or1k/

ENV PATH "$PATH:/opt/or1k/or1ksim/bin"

WORKDIR /tmp

LABEL maintainer Stafford Horne <shorne@gmail.com>
