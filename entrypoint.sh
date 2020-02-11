#!/bin/bash

cd  /api/vendors
if [ ! -e "init.lock" ]
then
    cp /yapi/config.json /api/
    npm run install-server
    touch /yapi/init.lock
fi

npm run start