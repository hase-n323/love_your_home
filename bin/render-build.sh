#!/usr/bin/env bash
# ↑スクリプトの最初の行で、Bashシェルを使ってこのスクリプトを実行すること
# exit on error
set -o errexit
# ↑「エラーが発生したらスクリプトを終了する」という設定をしている。これにより、たとえばbundle installが失敗した場合、以降のコマンドは実行されなくなる

bundle install
# アプリケーションのアセット（CSSやJavaScriptファイルなど）をプリコンパイルするためのものだ。プリコンパイルされたアセットは、パフォーマンスを向上させるために本番環境で使用される
bundle exec rake assets:precompile
# 不要なアセットを削除するためのもので、ディスクスペースを確保するために使われるカ。プリコンパイルされた古いアセットをクリーンアップすることで、最新のアセットのみを残すことができる
bundle exec rake assets:clean
# データベースのマイグレーションを実行するためのものだ。マイグレーションを使ってデータベースのスキーマを更新することで、新しいテーブルを作成したり、既存のテーブルを変更したりすることができる
bundle exec rake db:migrate
# データベースをリセットするコマンド
# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:rese