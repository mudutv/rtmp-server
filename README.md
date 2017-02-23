# rtmp-server
A rtmp server for offline useage

[中文版文档](https://github.com/mudutv/rtmp-server/blob/master/README-zh.md)

### How to deploy a rtmp server

#### 1.Prepare

Install docker first
```bash
sudo curl -fsSL https://get.docker.com/| sh
```
Add registry
```bash
sudo echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=https://99e392na.mirror.aliyuncs.com\"" | sudo tee -a /etc/default/docker 
```
Restart docker
```bash
sudo service docker restart
```

#### 2.Deploy

Make directories to store logs and videos
```bash
sudo mkdir data && mkdir data/record && mkdir data/logs && chmod -R 777 data
```
Start the server
```bash
sudo docker run -idt --restart=always --name rtmpserver -p 80:80 -p 1935:1935 -v ~/data:/data registry.aliyuncs.com/mudu/nginx-rtmp
```

### Tips

#### Important directories

video files `data/record`

log files `data/logs`

#### Important addresses

 web monitor `http://{your-server-ip}/stat`

rtmp address `rtmp://{your-server-ip}/live/{stream-name}`

hls address `http://{your-server-ip}/hls/{stream-name}/index.m3u8`

watch link on PC `http://{your-server-ip}/player/player.html?stream={Act Id}`

watch link on mobile `http://{your-server-ip}/player/mobile.html?stream={Act Id}`

#### License

This project is licensed under the [MIT license](http://opensource.org/licenses/mit-license.php).