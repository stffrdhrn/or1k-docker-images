# OpenRISC Docker Images

A few docker images that help setup a development environment.

How to use:

```
 # Place to put any code you want to work on
 WORKDIR=$HOME/work

 sudo docker build sim -t or1k-sim-env
 sudo docker run -it --rm -v ${WORKDIR}:/tmp/src/work:Z or1k-sim-env
```
