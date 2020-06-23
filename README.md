# common-images

[![Build Status](https://travis-ci.org/guoyk93/common-images.svg?branch=master)](https://travis-ci.org/guoyk93/common-images)
[![BMC Donate](https://img.shields.io/badge/BMC-Donate-orange)](https://www.buymeacoffee.com/vFa5wfRq6)

受够各种脑瘫镜像了, 因此我整了一套基于 `minit` 的镜像。

可以算是 `minit` 的实战演示了, 可以执行 `Go` 模板格式文件渲染, 花式环境变量配置注入, 跑初始化命令, 甚至可以跑 `cron` 。

针对类似场景的理想很丰满, 用 `Kubernetes` 的 `initContainers` 执行 `busybox` 命令, 再用 `configMap` 挂载配置文件, 再用什么什么东西一组合, 就好了。

现实是, 搞那么一套复杂的配置, 不如直接把我的 `minit` 放进去, 啥都有了。

## Images

* `guoyk/common-ubuntu:20.04` 
  + 添加了常用软件
  + 切换到中文和东八区
  + 脚本
    - `/opt/bin/apt-switch-aliyun-mirror` 切换 APT 源到阿里云镜像
    - `/opt/bin/dir-init-if-needed` 使用 `.initialized` 文件作为标记, 以一个文件夹的内容初始化另一个文件夹, 常用于容器配置目录挂载
  + 使用 `minit` 作为主进程

* `guoyk/common-jdk:11` 
  + 基于 `guoyk/common-ubuntu:20.04` 
  + 使用 `AdoptOpenJDK 11 (HotSpot)` , 安装在 `/opt/jdk` 
  + 添加了脚本 `/opt/bin/java-wrapper` , 可以替代 `java` 命令, 接受 `JAVA_XMS` , `JAVA_XMX` 和 `JAVA_OPTS` 环境变量

* `guoyk/common-elasticsearch:7.5.2` 
  + 基于 `guoyk/common-jdk:11` 
  + 安装在 `/opt/elasticsearch` 
  + 使用秘制 Java Agent 破解掉了 ES 的弱智限制, 现在跑在 `root` 用户下, 不用担心什么狗屁 `1000:1000` 用户目录权限问题
  + 安装了 `analysis-ik` , 配置文件目录 `/opt/elasticsearch/config/analysis-ik` 做了空目录自动初始化, 因此可以挂载卷
  + 数据目录 `/data` 
  + 日志目录 `/data/logs` 
  + 环境变量
    - `JAVA_XMS` 
    - `JAVA_XMX` 
    - 注意 `JAVA_OPTS` 无效
    - 任何以 `ES_` 开头, 格式为 `ES_AAAA_BBBB` 的环境变量, 都会以 `aaaa.bbbb` 为键值写入 `config/elasticsearch.yml` 

      比如 `ES_DISCOVERY_TYPE=single-node` 会在 `config/elasticsearch.yml` 配置文件内写入 `discovery.type: single-node` 

## Credits

Guo Y. K., MIT License
