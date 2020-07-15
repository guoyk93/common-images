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

* `guoyk/common-jdk:8` 
* `guoyk/common-jdk:11` 
  + 基于 `guoyk/common-ubuntu:20.04` 
  + 使用 `AdoptOpenJDK 8/11 (HotSpot)` , 安装在 `/opt/jdk` 
  + 添加了脚本 `/opt/bin/java-wrapper` , 可以替代 `java` 命令, 接受 `JAVA_XMS` , `JAVA_XMX` 和 `JAVA_OPTS` 环境变量

* `guoyk/common-elasticsearch:7.5.2` 
  + 基于 `guoyk/common-jdk:11` 
  + 安装在 `/opt/elasticsearch` 
  + 使用秘制 Java Agent 破解掉了 ES 的弱智限制, 现在跑在 `root` 用户下, 不用担心什么狗屁 `1000:1000` 用户目录权限问题
  + 数据目录 `/data` ，日志目录 `/data/logs` 
  + 安装了插件 `analysis-ik` , 配置文件目录 `/opt/elasticsearch/config/analysis-ik` 软链到了 `/data/config/analysis-ik` 并配置了空目录自动初始化
  + 环境变量
    - `JAVA_XMS` 
    - `JAVA_XMX` 
    - 注意 `JAVA_OPTS` 无效, 使用 `ES_JAVA_OPTS` 
    - 任何以 `ESCFG_` 开头, 格式为 `ESCFG_hello__world` 的环境变量, 都会以 `hello.world` 为键写入 `config/elasticsearch.yml` 

      比如 `ESCFG_discovery__type=single-node` 会在 `config/elasticsearch.yml` 配置文件内写入 `discovery.type: single-node` 

* `guoyk/common-rocketmq:4.6.1` 
* `guoyk/common-rocketmq:4.6.1-namesrv` 
* `guoyk/common-rocketmq:4.6.1-broker` 
  + 基于 `guoyk/common-jdk:8` 
  + 安装在 `/opt/rocketmq` 
  + 数据目录 `/data` 
  + 环境变量
    - `JAVA_XMS` 
    - `JAVA_XMX` 
    - `JAVA_OPTS` 
    - 针对 `broker` , 任何以 `RMQCFG_` 开头, 格式为 `RMQCFG_hello__world` 的环境变量, 都会以 `hello.world` 为键写入 `conf/broker.conf` 

* `guoyk/common-kibana:7.5.2` 
  + 基于 `guoyk/common-ubuntu:20.04` 
  + 持久化目录 `/data` 
  + 安装在 `/opt/kibana` 
  + 环境变量

    任何以 `KIBANACFG_` 开头, 格式为 `KIBANACFG_hello__world` 的环境变量, 都会以 `hello.world` 为键写入 `config/kibana.yml` 

* `guoyk/common-filebeat:7.5.2` 
  + 基于 `guoyk/common-ubuntu:20.4` 
  + 安装在 `/opt/filebeat` 
  + 持久化目录 `/data` 
  + 配置文件 `/opt/filebeat/filebeat.yml` 建议使用 `confgMap` 映射文件

* `guoyk/common-zookeeper:3.5.8` 
  + 基于 `guoyk/common-jdk:11` 
  + 安装在 `/opt/zookeeper` 
  + 持久化目录 `/data` 
  + 配置文件 `/opt/zookeeper/conf/zoo.cfg` 使用 `minit` 渲染
  + 环境变量

    任何以 `ZOOCFG_` 开头, 格式为 `ZOOCFG_hello__world` 的环境变量，会以 `hello.world` 为键，写入 `zoo.cfg` 

  + 默认为单机模式，如果启用集群，请设置如下环境变量
    - `ZOO_MYID` ，当前机器的编号
    - `ZOO_SERVER_X` , X 号机的地址，建议使用 `statefulSet + ClusterIP` 模式部署，然后在这里填写工作负载名即可

* `guoyk/common-kafka:2.4.1` 
  + 基于 `guoyk/common-jdk:11` 
  + 安装在 `/opt/kafka` 
  + 持久化目录 `/data` , **注意** 挂载 PV 时，物理卷的 `lost+found` 文件夹会造成 `kafka` 启动失败，请使用子路径挂载
  + 配置文件 `/opt/kafka/config/server.properties` 使用 `minit` 渲染
  + 环境变量

    任何以 `KAFKACFG_` 开头, 格式为 `KAFKACFG_hello__world` 的环境变量，会以 `hello.world` 为键，写入 `zoo.cfg` 

    比如 `KAFKACFG_zookeeper__connect=localhost:2181` 会在配置文件里面写入 `zookeeper.connect=localhost:2181` 

* `guoyk/common-alpine:3.11` 
  + 添加了常用软件
  + 切换到中文和东八区
  + 脚本
    - `/opt/bin/apk-switch-aliyun-mirror` 切换 APK 源到阿里云镜像
    - `/opt/bin/dir-init-if-needed` 使用 `.initialized` 文件作为标记, 以一个文件夹的内容初始化另一个文件夹, 常用于容器配置目录挂载
  + 使用 `minit` 作为主进程

* `guoyk/common-nginx` 
  + 基于 `guoyk/common-alpine:3.11` 
  + 使用以下配置文件组合
    - `/etc/nginx.conf` 
      - `/etc/nginx/conf.d/default.conf` 
        - `/etc/nginx/default.conf.d/*` 
        - `/etc/nginx/default.root.conf.d/*` 
  + 环境变量
    - `NGINX_CORS_EXTRA_HEADERS` 如果引用了 `/etc/nginx/snippets/cors_params` 使用此环境变量扩充 CORS 头

* `guoyk/common-nginx:proxy` 
  + 基于 `guoyk/common-nginx` , 用于服务正向代理
  + 环境变量
    - `NGINX_PROXY_TARGET` 代理目标，比如 `http://example.com` 
    - `NGINX_PROXY_HOST` 代理主机名，比如 `another.example.com` ，默认值 `-` 代表 `$proxy_host`，可用 `@` 代表 `$host`
    - `NGINX_PROXY_REAL_IP` 设置为 `on`，会自动发送 `X-Real-IP`
    - `NGINX_PROXY_FORWARDED_FOR` 设置为 `on` 会自动发送 `X-Forwarded-For`
    - `NGINX_PROXY_ENABLE_CORS` 是否启用 CORS, 设置为 `true` 即启用 CORS

## Credits

Guo Y. K., MIT License
