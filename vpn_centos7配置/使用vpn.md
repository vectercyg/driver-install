# shadowsocks ����socks����
## ����shadowsocks
pip install shadowsocksr-cli


## ���ö���
shadowsocksr-cli --setting-url https://fast.lycorisrecoil.org/link/wIQFN6d5sY3VA0lW\?sub\=1
## ���¶���
shadowsocksr-cli --update
## ����socks����
shadowsocksr-cli -s ����id
## �ر�socks����
shadowsocksr-cli -S ����id
## ��ʾssr�б�
shadowsocksr-cli --list
## ��ʾ����
shadowsocksr-cli --help
## ����ϸ���ݣ������https://pypi.org/project/shadowsocksr-cli/

# privoxy ��socks����ת��http����
## ����privoxy
sudo yum install privoxy
## ת������
vim /etc/privoxy/config
listen-address 127.0.0.1:8118           #8118 ��Ĭ�϶˿�
forward-socks5t / 127.0.0.1:1080        #ת�������ض˿�
## ����privoxy
systemctl enable privoxy
systemctl start privoxy
systemctl status privoxy
## ���û�������
export http_proxy=http://127.0.0.1:8118  #����Ķ˿ں����� privoxy �еı���һ��
export https_proxy=http://127.0.0.1:8118




