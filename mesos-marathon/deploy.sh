curl -fsSL https://get.docker.com/ | sh
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose
HOST_IP=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
echo $HOST_IP
sed -i "1s/^/nameserver $HOST_IP\n /" /etc/resolv.conf
export HOST_IP
docker-compose up -d
