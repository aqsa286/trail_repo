#! /bin/bash
# generate URL.sh script

script=/etc/URL.sh         #name of the script

(
cat << 'EOF'
#! /bin/bash

URL=https://www.google.com.pk
echo "URL=" $URL

Status_Code=$(curl --write-out "%{http_code}" $URL --output output.txt --silent )

if [ $Status_Code -eq 200 ]
then
  echo " URL is working.Status Code=$Status_Code "
else
  echo " URL is not working.Status Code=$Status_Code"
fi     

EOF
) >  $script  

chmod +x $script
sh $script 

crontab <<EOF
*/5 * * * * $script
EOF
