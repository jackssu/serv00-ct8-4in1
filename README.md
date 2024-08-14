# 参考缝合怪https://github.com/jackbrownsu
准备工作
- 在面板Additional servoces里打开Run your own applications为Enable  
- 在面板Port reservation里添加 Add port 开放UDP和TCP端口  
- Hysteria2或tuic用UDP端口，vmess、vless或Socks5用TCP端口
- 如果在CF官网手动设置argo隧道，Service要填写**`http://localhost:你开放的vmess端口`**
- CT8目前不推荐安装哪吒探针，安装探针容易封号
- 如果安装过其它脚本，请你安装以下脚本前用下面的清理服务器命令清除一次服务器后再安装！！！！！！
## SOCKS5只能用在环境变量里，严谨直连，直连封号，被请喝茶
## SOCKS5只能用在环境变量里，严谨直连，直连封号，被请喝茶


## 重置服务器（依次运行）  
```
pkill -kill -u 用户名
chmod -R 755 ~/* 
chmod -R 755 ~/.* 
rm -rf ~/.* 
rm -rf ~/*
pkill -kill -u 用户名
```

----

## 以下脚本可使用action自动连接ssh，自动检查并创建corn，同时可保号，确保不失联

### 给 serv00 & ct8 一键安装 socks5 & nezha-agent
> CM大佬的原始脚本  

```bash
bash <(curl -s https://raw.githubusercontent.com/cmliu/socks5-for-serv00/main/install-socks5.sh)
```

### 给 serv00 & ct8 一键安装 socks5 & hysteria2 & nezha-agent  
> 天诚大佬在CM大佬脚本基础上修改，增加了HY2协议  

```
bash <(curl -s https://raw.githubusercontent.com/gshtwy/socks5-for-serv00/main/install-socks5-hysteria.sh)
```

### 给 serv00 & ct8 一键安装 vmess-ws|vmess-ws-tls(argo)|hy2|socks|nezha  
> yutian81在CM、eooce老王、William三位大佬的基础上修改，去掉了tuic5协议，增加了socks5协议  
> 与eooce老王脚本一样，支持在一键脚本前置UUID、端口、哪吒参数、Argo参数  

```
bash <(curl -s https://github.com/jackssu/serv00-ct8/blob/main/sb4-00-socks.sh)
```

----

## 以下为 [eooce老王](https://github.com/eooce/Sing-box) 的原始脚本  
> 仅支持 serv00 & ct8 ，不支持vps，vps版在[这里](https://github.com/yutian81/Sing-box)  
> 仅使用nohup保活进程，不创建corn，服务器物理重启后需要重新运行，可手动创建corn    
> 支持自定义UUID、端口、哪吒参数、Argo参数，放在一键脚本之前，可随脚本一起运行  
> 列如：`UUID=xxxxxxxxxxxx PORT=15188 NEZHA_SERVER=nz.abcd.com NEZHA_PORT=5555 NEZHA_KEY=123ABC ARGO_DOMAIN=2go.admin.com ARGO_AUTH=xxxxxxx`  

### 一键四协议：vmess-ws|vmess-ws-tls(argo)|hy2|tuic5|nezha-agent
```
bash <(curl -Ls https://raw.githubusercontent.com/eooce/sing-box/main/sb_serv00.sh)
```
### 一键四协议无交互：vmess-ws|vmess-ws-tls(argo)|hy2|tuic5|nezha-agent
> UUID=xxxxxx NEZHA_SERVER=xxxxxx NEZHA_PORT=xxxxx NEZHA_KEY=xxxxx  ARGO_DOMAIN=xxxxx ARGO_AUTH=xxxxxx  VMESS_PORT=xxxxx  TUIC_PORT=xxxxx  HY2_PORT=xxxxx  
> 支持将以上参数前置在一键脚本前，实现无交互一键安装

```
bash <(curl -Ls https://raw.githubusercontent.com/eooce/sing-box/main/sb-00.sh)
```
### 一键三协议：vless-reality|hy2|tuic5|nezha-agent
```
bash <(curl -Ls https://raw.githubusercontent.com/eooce/sing-box/test/sb_00.sh)
```
### HY2单协议(无交互，修改参数一键执行)：hy2|nezha-agent
每次部署文件名随机不可cron
```
curl -s https://eooce.2go.us.kg/2.sh | PORT=UDP端口 NEZHA_SERVER=admin.cn NEZHA_PORT=5555 NEZHA_KEY=abc123 ba
```
可cron
```
curl -s https://raw.githubusercontent.com/eooce/scripts/master/containers-shell/00-hy2.sh | PORT=UDP端口 UUID=4967d7a9-0933-4351-ac2c-e8d1015ad629 bash
```
## TUIC单协议(无交互，修改参数一键执行)：tuic5|nezha-agent
每次部署文件名随机不可cron
```
curl -s https://eooce.2go.us.kg/tu.sh | PORT=UDP端口 NEZHA_SERVER=admin.cn NEZHA_PORT=5555 NEZHA_KEY=abc123 bash
```
可cron
```
curl -s https://raw.githubusercontent.com/eooce/scripts/master/containers-shell/00-tuic5.sh | PORT=UDP端口 UUID=4967d7a9-0933-4351-ac2c-e8d1015ad629 bash
```
## vless单协议(无交互，修改参数一键执行)：vless-ws-argo|nezha-agent, argo本地端口2052
```
curl -s https://raw.githubusercontent.com/eooce/scripts/master/containers-shell/00-vless.sh | NAME=serv00 UUID=4967d7a9-0933-4351-ac2c-e8d1015ad629 ARGO_DOMAIN=abc.123.net ARGO_AUTH=xxxxxxxxxxxxxxx bash
```
## 卸载所有脚本
```
bash -c "$(curl -L https://raw.githubusercontent.com/eooce/scripts/master/uninstall.sh)"
```

----
## Github Actions保活
添加 Secrets.`ACCOUNTS_JSON` 变量，示例
```json
[
  {"username": "cmliusss", "password": "7HEt(xeRxttdvgB^nCU6", "panel": "panel4.serv00.com", "ssh": "s4.serv00.com"},
  {"username": "cmliussss2018", "password": "4))@cRP%HtN8AryHlh^#", "panel": "panel7.serv00.com", "ssh": "s7.serv00.com"},
  {"username": "4r885wvl", "password": "%Mg^dDMo6yIY$dZmxWNy", "panel": "panel.ct8.pl", "ssh": "s1.ct8.pl"}
]
```
----
# 致谢
[cmliu](https://github.com/cmliu/socks5-for-serv00)、TG群友William、[eooce老王](https://github.com/eooce/Sing-box)  
