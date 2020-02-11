FROM node:8

RUN apt-get install -y  git python make openssl tar gcc
ENV TZ="Asia/Shanghai" HOME="/" VERSION=1.8.7

RUN mkdir /api
RUN wget -O /api/yapi.tgz http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-$VERSION.tgz

RUN tar zxvf /api/yapi.tgz  && mv /package /api/vendors 
RUN cd /api/vendors && \
    npm install --production

RUN rm -f /api/yapi.tgz
COPY entrypoint.sh /api/
RUN chmod 755 /api/entrypoint.sh

WORKDIR ${HOME}
EXPOSE 3000

ENTRYPOINT ["/api/entrypoint.sh"]

# 初始化后的账号为config.json 配置的邮箱， 密码为ymfe.org