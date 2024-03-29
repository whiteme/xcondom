# Mac OS
## 1. rootless 模式 & TCC.db  & Info.plist
> ### 重启电脑 
>>当听到重启提示音时 <kbd>Command</kbd> + <kbd>R</kbd>
>>
>>出现进度条是 没有 ***苹果logo***  表示成功进入 恢复模式

> ### 执行命令行
>> 在图形界面 上方菜单找到 ***终端***
>> 
执行 
`csrutil disable`

> ### 重启
>> 重启成功后，在命令行 检查系统是否安装 sqlite3
>> 
>> 其中anaconda兼容sqllite3

> ### TCC.db
>> `/Library/Application Support/com.apple.TCC` 进入此目录
>> 
>> 对此目录及所有内容赋权 `chmod -R 777 *`
>> 
>> 在此目录下执行 `sudo sqlite3 TCC.db`
>> 
>> `access` 表 `client=${ooxx}` 即目标记录 ，`auth_value`为配置值

> ### Info.plist
>> 几个关键的app(agent , helper[控制台ui],manager)
>> 修改Info.plist `<key>CFBundleIdentifier</key>` 与 `TCC.db的access表中的client` 对应关系
>> 也可以满足权限的灵活使用

## 2. fda  与 srp
### 不修改TCC.db的情况下，可模拟授权
>> /opt/.ooxx/config目录下有
**srp** 及 **fda** 两个文件
>>
>> 此外 /opt/ooxx/db目录的数据也可以通过`sqlite3`定期清理
>> 
`srp = Screen Recording Privilege`
>> 
`fda = Full Disk Access`

```mermaid
 graph TD;
    A[赋权]-->B[完全磁盘访问];
    A[赋权]-->C[屏幕录制];
    B-->D[制作fda与srp文件备份];
    C-->D[制作fda与srp文件备份];
    D-->F[尝试执行crashX.sh文件];
    F-->G[取消赋权];
```
