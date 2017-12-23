
# java

- install
```
which java
sudo yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel 
```
- set env
```
# check path
dirname $(readlink $(readlink $(which java)))

# set your directory (extract path before `/jre/bin`)
echo -e "
export JAVA_HOME=/usr/lib/jvm/java-**-openjdk-**
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar 
" >> ~/.bash_profile
```
- version check
```
sudo alternatives --config java
```

- test
```
cd tests
# conmpile
javac test_java.java
# exec
java test_java
```

# setup

- ref:https://qiita.com/genzouw/items/23cd0119715403e6e110

```
# JDKとGraphvizをインストール
sudo yum install -y \
    'graphviz*' \
    java-1.8.0-openjdk-devel \
;

# /usr/local/src にJarファイルを２つ配置します。
sudo mkdir -p /usr/local/src

$ cd /usr/local/src/

# 1. SchemaSpy 本体
$ sudo wget http://jaist.dl.sourceforge.net/project/schemaspy/schemaspy/SchemaSpy%205.0.0/schemaSpy_5.0.0.jar

# 2. PostgreSQL に接続するためのJDBCドライバ
$ sudo wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar

# driver for mysql (ref: https://sourceforge.net/p/schemaspy/discussion/462850/thread/f4d1d707/)
https://dev.mysql.com/downloads/connector/j/5.1.html

```
