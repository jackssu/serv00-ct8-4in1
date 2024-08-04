# socks5-for-serv00
给 serv00 & ct8 机器一键安装 socks5 & nezha-agent

## 如何使用？

### nohup模式
- 一键安装 **新手小白用这个！**
```bash
bash <(curl -s https://raw.githubusercontent.com/cmliu/socks5-for-serv00/main/install-socks5.sh)
```
----
### pm2模式
- 一键安装
```bash
bash <(curl -s https://raw.githubusercontent.com/cmliu/socks5-for-serv00/main/install-socks5-pm2.sh)
```
- 一键卸载  
```
pm2 unstartup && pm2 delete all && npm uninstall -g pm2
```

### singbox多协议一键脚本
老王版本William修改：vmess-ws|vmess-ws-tls(argo)|hy2|socks+哪吒
```
bash <(curl -Ls https://raw.githubusercontent.com/yutian81/socks5-for-serv00/main/serv00-sb4.sh)
```
可以不改动代码实现自定义UUID
```
UUID=你生成的UUID填在这里 bash <(curl -Ls https://raw.githubusercontent.com/yutian81/socks5-for-serv00/main/serv00-sb4.sh)
```

### 清空serv00  
> 删除所有主目录文件，依次运行
```
chmod -R 755 ~/*
rm -rf ~/*
chmod -R 755 ~/.*
rm -rf ~/.*
```
> 关闭所有进程，ssh会中断
```
kill -9 -1
```

----
## Github Actions保活
添加 Secrets.`ACCOUNTS_JSON` 变量
```json
[
  {"username": "cmliusss", "password": "7HEt(xeRxttdvgB^nCU6", "panel": "panel4.serv00.com", "ssh": "s4.serv00.com"},
  {"username": "cmliussss2018", "password": "4))@cRP%HtN8AryHlh^#", "panel": "panel7.serv00.com", "ssh": "s7.serv00.com"},
  {"username": "4r885wvl", "password": "%Mg^dDMo6yIY$dZmxWNy", "panel": "panel.ct8.pl", "ssh": "s1.ct8.pl"}
]
```

# 致谢
[RealNeoMan](https://github.com/Neomanbeta/ct8socks)、[k0baya](https://github.com/k0baya/nezha4serv00)、[eooce](https://github.com/eooce)
