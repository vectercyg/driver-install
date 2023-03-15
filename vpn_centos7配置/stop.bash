unset http_proxy
unset https_proxy

unset HTTP_PROXY
unset HTTPS_PROXY


systemctl stop privoxy
systemctl disable privoxy
systemctl status privoxy

shadowsocksr-cli -S 21