FROM dwdraju/alpine-curl-jq

CMD ./generate-auth-env-vars.sh && bash