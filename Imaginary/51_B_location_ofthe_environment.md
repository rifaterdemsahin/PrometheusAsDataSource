rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource/Imaginary (main) $ ifconfig
br-2ffee893b608: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.49.1  netmask 255.255.255.0  broadcast 192.168.49.255
        inet6 fe80::42:dff:fe1a:36df  prefixlen 64  scopeid 0x20<link>
        ether 02:42:0d:1a:36:df  txqueuelen 0  (Ethernet)
        RX packets 38599  bytes 61428570 (61.4 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 43281  bytes 10426068 (10.4 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:1c:01:2c:d0  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enP62535s1: flags=6211<UP,BROADCAST,RUNNING,SLAVE,MULTICAST>  mtu 1500
        inet6 fe80::7e1e:52ff:fe79:343b  prefixlen 64  scopeid 0x20<link>
        ether 7c:1e:52:79:34:3b  txqueuelen 1000  (Ethernet)
        RX packets 21011374  bytes 28975413965 (28.9 GB)
        RX errors 0  dropped 295898  overruns 0  frame 0
        TX packets 2170678  bytes 785892252 (785.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.85  netmask 255.255.0.0  broadcast 10.0.255.255
        inet6 fe80::7e1e:52ff:fe79:343b  prefixlen 64  scopeid 0x20<link>
        ether 7c:1e:52:79:34:3b  txqueuelen 1000  (Ethernet)
        RX packets 19881226  bytes 28622496357 (28.6 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1820114  bytes 762749646 (762.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 168168  bytes 448030969 (448.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 168168  bytes 448030969 (448.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth72a1ab2: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::9873:e3ff:fedc:16b9  prefixlen 64  scopeid 0x20<link>
        ether 9a:73:e3:dc:16:b9  txqueuelen 0  (Ethernet)
        RX packets 38599  bytes 61968956 (61.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 43299  bytes 10427424 (10.4 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource/Imaginary (main) $ 