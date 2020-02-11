# yapi-docker
开箱即用，可配置的yapi


## 使用

```bash
docker pull xldou/yapi-docker
```
* 需要挂在一个目录到 `/yapi`

    * 此目录包含一个`config.json`的文件来初始化配置yapi
    * 此目录会生成一个`init.lock`文件来标志是第一次初始化系统，还是关机后正常启动

* `config.json`配置项解读

    此文件直接继承[yapi的config.json](https://github.com/YMFE/yapi/blob/master/config_example.json),构建时会复制此文件到yapi目录下，请正确查看并配置
    ```json
    {
    "port": "3000",
    "adminAccount": "admin@admin.com",
    "db": {
        "servername": "127.0.0.1",
        "DATABASE": "yapi",
        "port": 27017,
        "user": "test1",
        "pass": "test1",
        "authSource": ""
    },
    "mail": {
        "enable": true,
        "host": "smtp.163.com",
        "port": 465,
        "from": "***@163.com",
        "auth": {
        "user": "***@163.com",
        "pass": "*****"
        }
    }
    }
    ```

* 升级版本提示：只要`yapi`官方数据库结构不变，你的`mongo`库还在，`init.lock`文件有，那就放心更新版本，本库也会跟着`yapi`版本发布新的版本，谢谢使用

* 日志文件夹`/api/vendors/log`,如需保存日志文件请挂载到外部

* 如有疑问或者见解请联系[github/xldou](https://github.com/xldou-cn/yapi-docker/issues)