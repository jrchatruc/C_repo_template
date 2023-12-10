FROM ubuntu:latest

RUN apt update && \
    apt install build-essential -y && \
    apt install valgrind -y

WORKDIR /usr/cryptopals

COPY test test/
COPY src src/
COPY Makefile .

CMD ["sh", "-c", "make SANITIZER_FLAGS=-fno-omit-frame-pointer valgrind"]
