docker images \
    | egrep none \
    | awk '{print $3}' \
    | xargs docker rmi 2> /dev/null
docker volume prune
