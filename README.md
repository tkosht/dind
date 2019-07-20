# dind
scripts for dind(docker in docker) environment for ubuntu 18.04

# build and up

```bash
sh bin/reup.sh
```

# using container environment

example of using container1 environment

```bash
$ cd container1/
direnv: loading .envrc
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
user@4609377c1213:~$ 
user@4609377c1213:~$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
user@4609377c1213:~$ 
```

# cleanup

```bash
sh bin/clean.sh
```
