#!/bin/bash

set -u
set -e
set -o noclobber

# $1: INI_FILE
# $2: SECTION
function ini_parser(){
eval $(sed -e 's/[[:space:]]*\=[[:space:]]*/=/g' \
  -e 's/;.*$//' \
  -e 's/[[:space:]]*$//' \
  -e 's/^[[:space:]]*//' \
  -e "s/^\(.*\)=\([^\"']*\)$/\1=\"\2\"/" \
  < $1 \
  | sed -n -e "/^\[$2\]/,/^\s*\[/{/^[^;].*\=.*/p;}")
}

# usage
ini_parser db.ini database
echo ${db_host}

# 先ほどJARファイルを配置したディレクトリ
JDBC_DRIVER_DIR=/usr/local/src
JDBC_DRIVER_PATH=${JDBC_DRIVER_PATH:-$(echo ${JDBC_DRIVER_DIR}/*.jar| sed "s/ /:/g")}

# use `-dbhelp` option when you need other database
# http://schemaspy.sourceforge.net/
DATABASE_TYPE=${DATABASE_TYPE:-mysql}

# database settings
DB_HOST=${DB_HOST:-${db_host}}
DB_NAME=${DB_NAME:-${db_name}}
DB_USER=${DB_USER:-${db_user}}
DB_PASS=${DB_PASS:-${db_password}}


[ ! -d "./${DB_NAME}" ] && mkdir -p "./${DB_NAME}"

#   -s        "public" \
# -hq           :ハイクオリティモード。出力結果がきれいになる！
# -noimplied    :「外部キーがない既存テーブル間の関連を推測し、ER図に反映してくれる」機能をOFFにする
java \
  -jar      "/usr/local/src/schemaSpy_5.0.0.jar" \
  -hq \
  -noimplied \
  -o        "./${DB_NAME}" \
  -charset  utf-8 \
  -dp       "${JDBC_DRIVER_PATH}" \
  -t        "${DATABASE_TYPE}" \
  -host     "${DB_HOST}" \
  -s        "${DB_NAME}" \
  -db       "${DB_NAME}" \
  -u        "${DB_USER}" \
  -p        "${DB_PASS}" \
;