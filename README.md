# ksar-docker
a docker container that has java and ksar and should help you see nice graphs from SAR logs.

# how to?
your server should be collecting sar files in `/var/log/sa/`
```
[root@ip-10-10-10-10]# ls /var/log/sa/
sar03  sar07  sar11  sar15  sar19  sar23  sar28
sar04  sar08  sar12  sar16  sar20  sar24  sar29
sar01  sar05  sar09  sar13  sar17  sar21  sar25  sar30
sar02  sar06  sar10  sar14  sar18  sar22  sar26  sar31
```

copy those files in to the `sa` directory of this project.
run `make prep-sar` this will concat all the files in to one big file. if you do not have sar locally installed, you will need to install sysstat.

run `make`, this should build and start ksar. then you need to load the concatenated data file `sar_mega`.

simples.


