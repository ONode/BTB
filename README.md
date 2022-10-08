#### Installation and fix bugs

Latest tag `7.6.210`

##### 使用手册：http://docs.bt.cn
##### 论坛地址：https://www.bt.cn/bbs
##### 反馈建议： https://www.bt.cn/bbs/forum-43-1.html
##### Bug提交：https://www.bt.cn/bbs/forum-39-1.html

#### Installation Bash

##### Centos
```bash
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
```
##### Ubuntu/Debian
```bash
wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh
```

#### One Line

##### V6 
`wget -q -O - https://cdn.jsdelivr.net/gh/ONode/BTB@7.6.207/patchv6.sh | bash`

##### V7
`wget -q -O - https://cdn.jsdelivr.net/gh/ONode/BTB@7.6.210/patchv7.sh | bash`