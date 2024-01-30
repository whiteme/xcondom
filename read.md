# Mac OS
## 进入rootless 模式
> ### 重启电脑 
>>当听到重启提示音时 <kbd>Command</kbd> + <kbd>R</kbd>
出现进度条是 没有 ***苹果logo***  表示成功进入 恢复模式

> ### 执行命令行
>> 在图形界面 上方菜单找到 ***终端*** 
执行 
`csrutil disable`

> ### 重启
>> 再命令行 检查系统是否安装 sqlite3
>> 其中anaconda兼容sqllite3

> ### TCC.db
>> `/Library/Application Support/com.apple.TCC` 进入此目录
>> 对此目录及所有内容赋权 `chmod -R 777 *`
>> 在此目录下执行 `sqlite3 TCC.db`
>> `access` 表 `client="ox"` 即目标记录 ，`auth_value`为配置值

>### /opt/ooxx  与 /opt/.ooxx 目录
>> /opt/.ooxx/config目录下有
**srp** 及 **fda** 两个文件
`srp = Screen Recording Privilege`
`fda = Full Disk Access`

 ```mermaid
graph TD
    A[赋权] --> B[完全磁盘访问]
    A[赋权] --> C[屏幕录制]
    D[复制fda、srp文件备份]
    B-->D
    C-->D
    D-->F[sudo执行crashX.sh]
    F-->G[取消赋权]
```
