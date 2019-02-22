
# SSH Server on Ubuntu

``` sh      https://help.ubuntu.com/lts/serverguide/openssh-server.html
sudo apt-get install openssh-server

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sudo chmod a-w /etc/ssh/sshd_config.original

sudo systemctl restart sshd.service
```

## ngrok

``` sh
ngrok authtoken xxxxxxx
ngrok tcp 22
```


``` sh

```


# Errors while install

## dpkg: error processing package *** (--configure)

```

```