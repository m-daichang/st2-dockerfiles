StackStorm Docker Containers
====

StackStormのコンポーネントをDockerで起動するためのリポジトリです。  
オリジナルから、一部設定を変更し、問題を解消させています。  
今後、公式側で対応される可能性が高いため、暫定的なものです。

# 変更箇所

オリジナルのGitリポジトリから、以下を変更しています。

* st2webの追加
* st2streamが起動するように修正

現状では、st2exporterは起動しません。

# 手順

1. `bash build.sh` によりDockerイメージをビルド実行してください。  
起動に必要なイメージが全て作成されます。
2. `docker-compose up -d` により起動してください。  
以下の状態になっていれば正常です。

```
$ docker-compose ps
              Name                             Command               State                     Ports
----------------------------------------------------------------------------------------------------------------------
st2dockerfiles_actionrunner_1       /entrypoint.sh                   Up
st2dockerfiles_api_1                /entrypoint.sh                   Up       9101/tcp
st2dockerfiles_auth_1               /entrypoint.sh                   Up       9100/tcp
st2dockerfiles_client_1             /entrypoint.sh st2               Exit 2
st2dockerfiles_data_1               /entrypoint.sh /bin/sh -c  ...   Exit 0
st2dockerfiles_exporter_1           /entrypoint.sh                   Exit 1
st2dockerfiles_garbagecollector_1   /entrypoint.sh                   Up
st2dockerfiles_mongo_1              /entrypoint.sh mongod            Up       27017/tcp
st2dockerfiles_notifier_1           /entrypoint.sh                   Up
st2dockerfiles_rabbitmq_1           docker-entrypoint.sh rabbi ...   Up       25672/tcp, 4369/tcp, 5671/tcp, 5672/tcp
st2dockerfiles_resultstracker_1     /entrypoint.sh                   Up
st2dockerfiles_rulesengine_1        /entrypoint.sh                   Up
st2dockerfiles_sensorcontainer_1    /entrypoint.sh                   Up
st2dockerfiles_stream_1             /entrypoint.sh                   Up       9102/tcp
st2dockerfiles_web_1                nginx -g daemon off;             Up       0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
```

# 利用する

## コマンドラインから利用

`client`コンテナを利用してください。

```
$ docker-compose run client st2 action list --pack=core
Starting st2dockerfiles_data_1
+-------------------+------+-------------------------------------------------------------------+
| ref               | pack | description                                                       |
+-------------------+------+-------------------------------------------------------------------+
| core.announcement | core | Action that broadcasts the announcement to all stream consumers.  |
| core.http         | core | Action that performs an http request.                             |
| core.local        | core | Action that executes an arbitrary Linux command on the localhost. |
| core.local_sudo   | core | Action that executes an arbitrary Linux command on the localhost. |
| core.noop         | core | Action that does nothing                                          |
| core.remote       | core | Action to execute arbitrary linux command remotely.               |
| core.remote_sudo  | core | Action to execute arbitrary linux command remotely.               |
| core.sendmail     | core | This sends an email                                               |
| core.windows_cmd  | core | Action to execute arbitrary Windows command remotely.             |
+-------------------+------+-------------------------------------------------------------------+
```

## GUIから利用

以下にアクセスしてください。 `st2admin / Ch@ngeMe`でログインすることができます。

[https://localhost/](https://localhost/)

# Reference

* https://github.com/StackStorm/st2-dockerfiles
* https://github.com/enykeev/st2box/

