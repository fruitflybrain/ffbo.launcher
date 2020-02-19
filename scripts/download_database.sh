
echo Downloading Database ...

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1IOTpQDeb-byw6Zvcs9N3JrWjgun3cnWN' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1IOTpQDeb-byw6Zvcs9N3JrWjgun3cnWN" -O ffbo_db.tar.gz && rm -rf /tmp/cookies.txt
tar zxvf ffbo_db.tar.gz
rm ffbo_db.tar.gz

echo Done.
