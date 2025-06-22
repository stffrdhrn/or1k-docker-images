FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
 curl xz-utils

RUN groupadd -g 998 or1kuser && \
    useradd -m -u 998 -g or1kuser or1kuser

ARG OR1K_TOOLCHAIN_PKG=or1k
ARG OR1K_TOOLCHAIN_VERSION=15.1.0-20250621
ARG OR1K_TOOLCHAIN_SITE=https://github.com/stffrdhrn/or1k-toolchain-build/releases/download
RUN mkdir -p /opt/or1k \
  && cd /opt/or1k \
  && curl --remote-name --location \
   ${OR1K_TOOLCHAIN_SITE}/${OR1K_TOOLCHAIN_PKG}-${OR1K_TOOLCHAIN_VERSION}/or1k-elf-${OR1K_TOOLCHAIN_VERSION}.tar.xz \
  && tar -xf or1k-elf-${OR1K_TOOLCHAIN_VERSION}.tar.xz \
  && rm /opt/or1k/*.tar.*

ENV PATH "$PATH:/opt/or1k/or1k-elf/bin"

RUN or1k-elf-gcc --version
