# myssr
```
docker build -t myssr .
```
## cleanup
```
docker ps -a|grep -E "762833ebcb37|c69094c1efaf|e816b23f7e3c|cae7b8665fc8"|awk '{print $1}'|xargs docker rm
docker ps
docker images|grep none|awk '{print $3}'|xargs docker rmi
docker images

```
## remove
```
docker images|grep myssr|awk '{print $3}'|xargs docker rmi 
```