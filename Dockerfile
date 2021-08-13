# ローカルのRuby ver.に合わせた
FROM ruby:2.6.5

# 環境変数
ENV APP_ROOT /app

# 必要なライブラリを取得

# RUN apt-get update -qq \
#   # curlをインストール
#   # -y : すべてyesと答える
#   && apt-get install -y curl \
#   # 公開鍵を取得
#   && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#   # 必要？
#   && apt-get update \
#   # yarnをインストール
#   && apt-get install -y yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  # 公開鍵を取得し、
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  # apt-get → Ubuntuを使う
  # apt-get update : インストール可能なパッケージの「一覧」を更新する
  # -qq : エラー以外は表示しない
  apt-get update -qq && \
  # インストール
  apt-get install -y --no-install-recommends \
  build-essential \
  nodejs \
  yarn && \
  # キャッシュされているdebファイルを削除
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# コンテナ内の作業ディレクトリを指定(無い場合はディレクトリを作成してから実行されるのでmkdir不要)
WORKDIR $APP_ROOT

# 先にGemfileを移す
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

# bundlerをインストール
RUN gem install bundler
# Gemfile通りにインストール
RUN bundle install

# コンテナ内にアプリケーションをコピー
COPY . $APP_ROOT

# コンテナが起動する度に実行するコマンド
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]

# 出力ポート
EXPOSE 3000

# Railsサーバ起動
# composeで指定しているから不要？
CMD ["rails", "server", "-b", "0.0.0.0"]