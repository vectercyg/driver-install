unset http_proxy
unset https_proxy

systemctl stop privoxy
systemctl disable privoxy
systemctl status privoxy

shadowsocksr-cli -S 21