# common-images

个人使用的镜像

## Images

* `guoyk/common-ubuntu:20.04` 
  + 添加了常用软件
  + 切换到中文和东八区
  + 添加了脚本 `/opt/bin/apt-switch-aliyun-mirror` 切换 APT 源到阿里云镜像
  + 使用 `minit` 作为主进程

* `guoyk/common-jdk:11` 
  + 基于 `guoyk/common-ubuntu:20.04` 
  + 使用 `AdoptOpenJDK 11 (HotSpot)` ，安装在 `/opt/jdk` 
  + 添加了脚本 `/opt/bin/java-wrapper` ，可以替代 `java` 命令，接受 `JAVA_XMS` , `JAVA_XMX` 和 `JAVA_OPTS` 环境变量

## Credits

Guo Y. K., MIT License
