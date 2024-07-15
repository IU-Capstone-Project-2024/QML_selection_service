FROM debian:bullseye-slim as intermediate
WORKDIR /app
RUN apt update && apt install -y wget git xz-utils curl unzip
RUN wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.6-stable.tar.xz
RUN tar xf flutter_linux_3.10.6-stable.tar.xz && rm flutter_linux_3.10.6-stable.tar.xz
ENV PATH="${PATH}:/app/flutter/bin"
RUN git config --global --add safe.directory /app/flutter
COPY . /app
RUN flutter upgrade
RUN flutter pub get
RUN flutter build web --release

FROM debian:bullseye-slim
WORKDIR /app
COPY --from=intermediate /app .
RUN apt update && apt install -y git && rm -rf /var/lib/apt/lists/*
RUN git config --global --add safe.directory /app/flutter
ENV PATH="${PATH}:/app/flutter/bin"
RUN flutter pub get
#RUN useradd -m flutter_user
#RUN chown -R flutter_user:flutter_user /app && chmod -R 755 /app
#USER flutter_user
ENTRYPOINT ["flutter", "run", "--release", "--web-renderer", "html", "-d", "web-server", "--web-port=8080", "--web-hostname", "0.0.0.0"]