#!/bin/bash

# # 模拟赋权使用
#   需要使用sudo权限执行该脚本
# 使用前，请先按照 app提示赋予 屏幕录制 及 磁盘完全访问 权限
# 然后进入
#  cd  /opt/.yunshu/config 
#  sudo cp fda fdabak
#  sudo cp srp srpbak
# 要保证 fda srp 这两个文件 root:wheel 用户 644 权限
# 再取消 屏幕录制 及 磁盘完全访问

#set -xe

USER_NAME=shenn-litscope

function osx(){
   for item in {1..2}; do
      cd /opt/.yunshu/config
      chmod 644 fda
      cp fdabak fda 
      cp srpbak srp
      ls -al
   done
   
}

function db(){
   cd /opt/yunshu/db
   chown ${USER_NAME} *.db
   for dbfile in `ls | grep db`;do
       echo " " > ${dbfile}
   done

}

while [ true ]; do
   echo " ------- bingo ---- `date +"%Y-%m-%d %T"`---- "
   osx
   #db
   sleep 1
done


