#!/bin/sh

SEPARATOPION='---------------------------'
START_MESSAGE='check container status.'
DOCKER_COMPOSE_FILE='./docker-compose.yml'
TMP_DIR=${PWD}
# CHANGE Directory.
USER_SERVICE=${HOME}/dev/path/user
ADMIN_SERVICE=${HOME}/dev/path/admin

# @param {string} message
showMessage() {
  echo ${SEPARATOPION}
  echo $1
}

echo ${SEPARATOPION}
echo ${START_MESSAGE}

# -qオプション container idのみを表示
# /dev/null: 出力が破棄され、なにも表示されない。
# 2(標準エラー出力) を/dev/nullに破棄することで、1(標準出力)のみを出力する。
if [[ "$(docker-compose -f ${DOCKER_COMPOSE_FILE} ps -q 2>/dev/null)" == "" ]]; then
  # コンテナが立ち上がっていない状態の時
  showMessage 'Up Reverse Proxy.'
  docker-compose -f ${DOCKER_COMPOSE_FILE} up -d
  showMessage 'Up User Service.'
  cd ${USER_SERVICE} && make dev
  showMessage 'Up Admin Service.'
  cd ${ADMIN_SERVICE} && make dev
else
　# コンテナが立ち上がっている状態の時
  showMessage 'Down Admin Service.'
  cd ${ADMIN_SERVICE} && make dev
  showMessage 'Down User Service.'
  cd ${USER_SERVICE} && make dev
  showMessage 'Down Reverse Proxy.'
  cd ${TMP_DIR} && docker-compose -f ${DOCKER_COMPOSE_FILE} down
fi

# 現在のDocker コンテナの状態を出力
showMessage 'Current Docker Status.'
echo ${SEPARATOPION}
docker ps -a
echo ${SEPARATOPION}

