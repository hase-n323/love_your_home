# このスクリプトは、アプリケーションのビルドとセットアップを自動化するために使用される
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate