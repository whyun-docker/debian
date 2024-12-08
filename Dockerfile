ARG VERSION
FROM debian:${VERSION}

LABEL maintainer="yunnysunny@gmail.com"

# 安装依赖
ARG VERSION
RUN if [ "$VERSION" = "bookworm" ] || [ "$VERSION" = "bookworm-slim" ] || \
  [ "$VERSION" = "stable" ] || [ "$VERSION" = "stable-slim" ]; then \
    sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list.d/debian.sources; \
  else \
    sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list; \
  fi && \
  apt-get update \
  && apt-get --no-install-recommends  install tzdata -y \
  && apt-get clean \
  && rm /var/lib/apt/lists/* -rf

# 使用东八区时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime