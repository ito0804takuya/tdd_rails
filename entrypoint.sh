#!/bin/bash
set -e

# Railsの既存のserver.pidを削除
# docker-composeで実行されるため不要？
rm -f /myapp/tmp/pids/server.pid

# コンテナのメインプロセス（DockerfileでCMDとして設定されているもの）を実行
exec "$@"