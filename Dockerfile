FROM node:8

ENV TZ="Asia/Shanghai" HOME="/" VERSION=1.8.7

RUN mkdir /api
RUN wget -O /api/yapi.tgz https://codeload.github.com/YMFE/yapi/tar.gz/v${VERSION}

RUN tar zxvf /api/yapi.tgz  && mv /yapi-$VERSION /api/vendors 
RUN rm -rf /api/yapi.tgz

RUN cd /api/vendors && \
    npm install --production

COPY entrypoint.sh /api/
RUN chmod 755 /api/entrypoint.sh

WORKDIR ${HOME}
EXPOSE 3000

ENTRYPOINT ["/api/entrypoint.sh"]

# 初始化后的账号为config.json 配置的邮箱， 密码为ymfe.org