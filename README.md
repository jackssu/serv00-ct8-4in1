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

### 清空重置serv00  
> 更改权限：
```
find ~ -type f -exec chmod 644 {} \; 2>/dev/null
find ~ -type d -exec chmod 755 {} \; 2>/dev/null
```
> 删除文件：
```
find ~ -type f -exec rm -f {} \; 2>/dev/null
```
> 删除空目录：
```
find ~ -type d -empty -exec rmdir {} \; 2>/dev/null
```
> 再次删除剩余的文件和目录：
```
find ~ -exec rm -rf {} \; 2>/dev/null
```
> 清理进程：
```
pkill -kill -u xpfcom
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

# 致谢
[RealNeoMan](https://github.com/Neomanbeta/ct8socks)、[k0baya](https://github.com/k0baya/nezha4serv00)、[eooce](https://github.com/eooce)
