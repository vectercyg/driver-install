shadowsocksr-cli -s 21

systemctl enable privoxy
systemctl start privoxy
systemctl status privoxy

export http_proxy=http://127.0.0.1:8118
export https_proxy=http://127.0.0.1:8118