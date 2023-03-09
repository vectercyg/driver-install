# shadowsocks 启动socks代理
## 下载shadowsocks
pip install shadowsocksr-cli


## 设置订阅
shadowsocksr-cli --setting-url https://fast.lycorisrecoil.org/link/wIQFN6d5sY3VA0lW\?sub\=1
## 更新订阅
shadowsocksr-cli --update
## 启动socks代理
shadowsocksr-cli -s 配置id
## 关闭socks代理
shadowsocksr-cli -S 配置id
## 显示ssr列表
shadowsocksr-cli --list
## 显示帮助
shadowsocksr-cli --help
## 更详细内容，请访问https://pypi.org/project/shadowsocksr-cli/

# privoxy 将socks代理转成http代理
## 下载privoxy
sudo yum install privoxy
## 转发配置
vim /etc/privoxy/config
listen-address 127.0.0.1:8118           #8118 是默认端口
forward-socks5t / 127.0.0.1:1080        #转发到本地端口
## 启动privoxy
systemctl enable privoxy
systemctl start privoxy
systemctl status privoxy
## 配置环境变量
export http_proxy=http://127.0.0.1:8118  #这里的端口和上面 privoxy 中的保持一致
export https_proxy=http://127.0.0.1:8118




