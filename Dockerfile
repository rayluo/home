FROM debian:12

# Set environment variables
ENV LAZYGIT_VERSION=0.54.2
## No need to set GIT_VERSION as the default Git version in Debian 12 is 2.39.5
#ENV GIT_VERSION=2.39.5

# Update certificates and install dependencies and Git
RUN apt-get update && \
    apt-get install -y --reinstall ca-certificates && \
    apt-get install -y --no-install-recommends \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Lazygit
RUN curl -sSL https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz | tar xz -C /usr/local/bin lazygit && \
    chmod +x /usr/local/bin/lazygit

# Set the entrypoint
#ENTRYPOINT ["lazygit"]