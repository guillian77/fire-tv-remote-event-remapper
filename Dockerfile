FROM ubuntu:22.04

# pip install --no-binary :all: adb
RUN apt update -y && apt install -y --no-install-recommends android-tools-adb
