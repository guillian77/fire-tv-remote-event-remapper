FROM ubuntu:22.04

RUN apt update -y \
    && apt install -y --no-install-recommends android-tools-adb \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
