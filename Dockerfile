FROM ruby:3.2.3

# Node.jsとYarnのインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y nodejs yarn

# 作業ディレクトリの設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピーしてbundlerを実行
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.5.16
RUN bundle install

# アプリケーションコードをコピー
COPY . .

# Yarnを使ってJavaScriptの依存関係をインストール
RUN yarn install --check-files

# ポートの設定
EXPOSE 3000

# サーバーの起動
CMD ["rails", "server", "-b", "0.0.0.0"]

