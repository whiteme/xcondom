#!/bin/bash
sudo rm -rf /opt/.yunshu/ && sudo rm -rf /opt/yunshu
ps -ef |grep -v grep |  grep Yunshu | awk '{print $2}' |  xargs sudo  kill -9
