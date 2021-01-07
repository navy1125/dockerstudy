# 国内北方无法拉取镜像的问题

```
vim /etc/docker/daemon.json
{
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}


echo DOCKER_OPTS="$DOCKER_OPTS --registry-mirror=http://hub-mirror.c.163.com" >> /etc/default/docker
