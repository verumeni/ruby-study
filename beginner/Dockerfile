# Dockerfile
FROM ruby:3.4

WORKDIR /app

# Bundlerの設定（任意）
ENV BUNDLE_PATH=/usr/local/bundle
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3

# 先にGemfile系だけコピーしてbundle installをキャッシュしやすくする
COPY Gemfile Gemfile.lock* ./
RUN bundle install || true

# アプリ本体
COPY . .

# 学習用にコンテナを起動し続ける
CMD ["bash"]