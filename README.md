# OpenRISC Docker Images

A few docker images that help setup a development environment.

This can be built using: `build.sh`.

Once build the following images will be created.

 - `or1k-sim-env` - a shell which contains an `or1k-elf-gcc` cross compiler
   as well as the openrisc simulator `or1ksim`.
 - `or1k-verilog-env` - a shell which contains an `or1k-elf-gcc` cross compiler
   as well a fusesoc and verilog modules used to run OpenRISC verilog simulations.

## How to use the images:

### Build an app and run it on the Simulator

```
$ podman pull stffrdhrn/or1k-sim-env
$ podman run -it --rm stffrdhrn/or1k-sim-env

root@011a54cf7988:/tmp# cat <<EOF >hello.c
> #include <stdio.h>
>
> int main() {
>     puts("Hello\n");
>     return 0;
> }
> EOF
root@011a54cf7988:/tmp# or1k-elf-gcc hello.c -o hello
root@011a54cf7988:/tmp# sim -f /opt/or1k/sim.cfg hello
```

### Build an app and run it the Verilog testbench

```
$ podman pull stffrdhrn/or1k-verilog-env
$ podman run -it --rm stffrdhrn/or1k-verilog-env

or1kuser@fb306c0dc35e:/tmp/src$ cat <<EOF >hello.c
> #include <stdio.h>
>
> int main() {
>     puts("Hello\n");
>     return 0;
> }
> EOF
or1kuser@fb306c0dc35e:/tmp/src$ or1k-elf-gcc hello.c -o hello
or1kuser@fb306c0dc35e:/tmp/src$ cd cores
or1kuser@fb306c0dc35e:/tmp/src/cores$ fusesoc core-info mor1kx-generic
or1kuser@fb306c0dc35e:/tmp/src/cores$ fusesoc run --target mor1kx_tb mor1kx-generic --elf_load ../hello
```
