FROM or1k-base:latest AS stripper

RUN apt-get update && apt-get install -y \
 binutils \
 file

RUN find /opt/or1k/or1k-embecosm-${OE_TOOLCHAIN}/ -exec file {} \; | grep 'ELF 64.*x86' |cut -d: -f1| xargs strip
RUN for f in /opt/or1k/or1k-embecosm-${OE_TOOLCHAIN}/or1k-elf/bin/*; do \
      ln -sf ../../bin/or1k-elf-$(basename $f) $f; \
    done

FROM ubuntu:latest

RUN groupadd -g 998 or1kuser && \
    useradd -m -u 998 -g or1kuser or1kuser

RUN mkdir -p /opt/or1k
COPY --from=stripper /opt/or1k/or1k-embecosm-*/ /opt/or1k/or1k-elf/

ENV PATH "$PATH:/opt/or1k/or1k-elf/bin"
LABEL maintainer Stafford Horne <shorne@gmail.com>
