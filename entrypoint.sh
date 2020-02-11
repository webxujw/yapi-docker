#!/bin/bash

cd  /api/vendors
cp /yapi/config.json /api/
if [ ! -e "/yapi/init.lock" ]
then
    npm run install-server
    touch /yapi/init.lock
fi

npm run start