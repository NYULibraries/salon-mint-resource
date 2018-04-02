#!/bin/bash

# gets environment variable secrets from .env
# source: https://stackoverflow.com/questions/19331497/set-environment-variables-from-file
export $(cat .env | grep -v ^\# | xargs)

accessToken=$(
  curl -s -X POST \
  -d grant_type=client_credentials \
  -d client_id=$SALON_CLIENT_ID \
  -d client_secret=$SALON_CLIENT_SECRET \
  https://dev.login.library.nyu.edu/oauth/token \ |
  sed 's/.*"access_token": *"\([^"]*\)".*}/\1/'
)

output=""
counter=${1:-1}
while [ $counter -gt 0 ]
do
  temp=$(
    curl -s -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${accessToken}" \
    -X POST \
    https://persistent-dev.library.nyu.edu/create_empty_resource \ |
    sed 's/.*"id": *"\([^"]*\)".*}/\1/'
  )

  # remove sorrounding quotation-marks
  temp="${temp%\"}"
  temp="${temp#\"}"

  output+=${temp}
  output+="\n"
  counter=$(( $counter - 1 ))
done

printf $output
