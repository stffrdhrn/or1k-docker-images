FROM or1k-base-stripped:latest
RUN apt-get update && apt-get install -y \
 git \
 iverilog \
 libelf-dev \
 python3-pip \
 xz-utils

USER or1kuser
ENV HOME /home/or1kuser

ENV PATH "$PATH:/tmp/tools/or1k-embecosm-${OE_TOOLCHAIN}/bin"
ENV PATH "$PATH:$HOME/.local/bin"

RUN pip install --user fusesoc
RUN mkdir -p /tmp/src/cores
WORKDIR /tmp/src/cores
# Fusesoc init is now this
RUN fusesoc library add fusesoc_cores   https://github.com/fusesoc/fusesoc-cores
# Install SOC test bench
RUN fusesoc library add elf-loader      https://github.com/fusesoc/elf-loader.git
RUN fusesoc library add intgen          https://github.com/stffrdhrn/intgen.git
RUN fusesoc library add mor1kx-generic  https://github.com/stffrdhrn/mor1kx-generic.git
RUN fusesoc library add or1k_marocchino https://github.com/openrisc/or1k_marocchino.git
RUN fusesoc library add mor1kx          https://github.com/openrisc/mor1kx.git

RUN mkdir -p /tmp/src/work
VOLUME /tmp/src/work

WORKDIR /tmp/src

LABEL maintainer Stafford Horne <shorne@gmail.com>
