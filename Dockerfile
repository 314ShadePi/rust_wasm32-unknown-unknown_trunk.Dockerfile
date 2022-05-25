FROM ubuntu:22.04

WORKDIR /app
USER root
RUN apt update -y
RUN apt upgrade -y
RUN apt install apt-transport-https -y
RUN apt install ca-certificates -y
RUN apt install curl -y
RUN apt install software-properties-common -y
RUN apt install gcc -y
RUN apt install git -y
RUN apt install libssl-dev -y
RUN apt install pkg-config -y
RUN apt autoremove -y
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup target add wasm32-unknown-unknown
RUN cargo install trunk
RUN cargo install wasm-bindgen-cli
RUN cargo clean
