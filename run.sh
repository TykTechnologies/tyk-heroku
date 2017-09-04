#!/bin/bash

TYKDIR=/app/.apt/opt/tyk-gateway
TYKCONFPATH=/app/tyk.conf

REDIS_URL=`echo $REDIS_URL | sed -e s,redis://,,g`
userpass=`echo $REDIS_URL | grep @ | cut -d@ -f1`
hostport=`echo $REDIS_URL |  cut -d@ -f2`
REDISUSER=`echo $userpass | grep : | cut -d: -f1`
REDISPW=`echo $userpass | grep : | cut -d: -f2`
REDISHOST=`echo $hostport | grep : | cut -d: -f1`
RPORT=`echo $hostport | grep -oE "[^:]+$"`

cp ${TYKCONFPATH}.tpl $TYKCONFPATH

sed -i 's/RPORT/'$RPORT'/g' $TYKCONFPATH
sed -i 's/PORT/'$PORT'/g' $TYKCONFPATH
sed -i 's/SECRET/'$SECRET'/g' $TYKCONFPATH
sed -i 's/ORGID/'$ORGID'/g' $TYKCONFPATH
sed -i 's/APIKEY/'$APIKEY'/g' $TYKCONFPATH
sed -i 's/REDISHOST/'$REDISHOST'/g' $TYKCONFPATH
sed -i 's/REDISUSER/'$REDISUSER'/g' $TYKCONFPATH
sed -i 's/REDISPW/'$REDISPW'/g' $TYKCONFPATH
sed -i 's/MDCB/'$MDCB'/g' $TYKCONFPATH


if [ -z "$BINDSLUG" ]; then
    sed -i 's/USESLUGS/'false'/g' $TYKCONFPATH
else
    echo "--> Binding to slugs instead of listen paths"
    sed -i 's/USESLUGS/'true'/g' $TYKCONFPATH
fi

echo "--> Starting Tyk Hybrid Heroku"
echo ""
cd $TYKDIR
./tyk --conf=$TYKCONFPATH

