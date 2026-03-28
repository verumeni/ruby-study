FROM ruby:3.4-slim

WORKDIR /app

# 中級編で使いやすい最低限のOS依存（sqlite, native gem build）
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  git \
  libsqlite3-dev \
  sqlite3 \
  pkg-config \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Bundler設定
ENV BUNDLE_PATH=/usr/local/bundle
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3

# 依存を先に解決（Gemfileが無い段階でも落ちないようにしておく）
COPY Gemfile Gemfile.lock* ./
RUN bundle install || true

# アプリ本体
COPY . .

# 学習用途: まずはシェル起動
CMD ["bash"]