#!/bin/bash

# gets environment variable secrets from .env
if [ ! -f .env ]; then
  echo "WARNING: .env file not found! It is recommended you keep your application secrets in .env file."
else
  # source: https://stackoverflow.com/questions/19331497/set-environment-variables-from-file
  export $(cat .env | grep -v ^\# | xargs)
fi


if [ -z "$SALON_CLIENT_ID" ]
then
  echo "Enter your APPLICATION ID (no quotation marks):"
  read client_id
  export SALON_CLIENT_ID=${client_id}
fi

if [ -z "$SALON_CLIENT_SECRET" ]
then
  echo "Enter your SECRET (no quotation marks):"
  read client_secret
  export SALON_CLIENT_SECRET=${client_secret}
fi

accessToken=$(
  curl -s -X POST \
  -d grant_type=client_credentials \
  -d client_id=$SALON_CLIENT_ID \
  -d client_secret=$SALON_CLIENT_SECRET \
  https://login.library.nyu.edu/oauth/token \ |
  sed 's/.*"access_token": *"\([^"]*\)".*}/\1/'
)

output="\n"
counter=${1:-1}
while [ $counter -gt 0 ]
do
  temp=$(
    curl -s -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${accessToken}" \
    -X POST \
    https://persistent.library.nyu.edu/arch/create_empty_resource \ |
    sed 's/.*"id": *"\([^"]*\)".*}/\1/'
  )

  # remove sorrounding quotation-marks
  temp="${temp%\"}"
  temp="${temp#\"}"

  output+=${temp}
  output+="\n"
  counter=$(( $counter - 1 ))

  printf "."
done

printf $output
