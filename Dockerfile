FROM debian:bullseye

LABEL authors="Roy To <roy.to@itdogsoftware.co>"

# Install library & necessary service
RUN apt-get update -y && apt-get install curl unzip git gpg openssh-client docker.io postgresql-client mariadb-client -y && rm -rf /var/lib/apt/lists/*

# add docker-compose plugin
RUN curl -SL "https://github.com/docker/compose/releases/download/v2.30.3/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

# Add aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && rm awscliv2.zip

# Add nodejs
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && bash -c "source ~/.bashrc && nvm install 20"

