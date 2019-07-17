# dind
scripts for dind(docker in docker) environment


# build and up
```bash
mkdir -p user1
docker-compose up -d
```
c.f. `bin/up.sh`


# run (exec)
```bash
docker-compose exec user1 bash
```
c.f. `bin/run.sh`
