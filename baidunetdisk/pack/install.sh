#!/bin/bash

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -t|--save) save="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done
echo "use save path = $save"
docker build --tag baidunetdisk .
docker container create -v $save:/home/baidu/baidunetdiskdownload/ -p 6080:6080 -p 5901:5901 --name baidunetdisk_downloader baidunetdisk