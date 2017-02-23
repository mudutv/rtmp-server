# rtmp-server
一套内网直播解决方案

### 如何部署

#### 1.环境准备

首先安装docker
```bash
sudo curl -fsSL https://get.docker.com/| sh
```
设置docker registry
```bash
sudo echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=https://99e392na.mirror.aliyuncs.com\"" | sudo tee -a /etc/default/docker 
```
重启docker服务
```bash
sudo service docker restart
```

#### 2.部署

新建文件夹以储存视频和日志
```bash
sudo mkdir data && mkdir data/record && mkdir data/logs && chmod -R 777 data
```
运行rtmp server
```bash
sudo docker run -idt --restart=always --name rtmpserver -p 80:80 -p 1935:1935 -v ~/data:/data registry.aliyuncs.com/mudu/nginx-rtmp
```

### 小提示

#### 重要文件夹

视频储存文件夹 `data/record`

日志储存文件夹 `data/logs`

#### 重要链接

网页监控 `http://{your-server-ip}/stat`

rtmp地址 `rtmp://{your-server-ip}/live/{stream-name}`

hls地址 `http://{your-server-ip}/hls/{stream-name}/index.m3u8`

PC端观看地址 `http://{your-server-ip}/player/player.html?stream={stream-name}`

手机端观看地址 `http://{your-server-ip}/player/mobile.html?stream={stream-name}`

#### 关于部署脚本
 
为了更快部署rtmp server，我们提供了一键安装脚本，
 
`curl -o install.sh https://raw.githubusercontent.com/mudutv/rtmp-server/master/install.sh && chmod +x install.sh && ./install.sh` 

#### License

本项目采用 [MIT许可](http://opensource.org/licenses/mit-license.php).