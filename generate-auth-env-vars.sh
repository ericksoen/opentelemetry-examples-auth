#!/bin/bash

environment_file_name="service.env"

if test -f $environment_file_name; then
    rm $environment_file_name
fi

bearer_token=`curl --silent --data "grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret" $token_endpoint | jq -r .access_token`

echo "GATEWAY_BEARER_TOKEN=\"$bearer_token\""  >> $environment_file_name
echo "ISSUER_URL=\"$issuer_url\"" >> $environment_file_name