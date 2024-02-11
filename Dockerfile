# Use Ubuntu as the base image for x86_64 platform
FROM --platform=linux/x86_64 ubuntu:latest

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    git luajit curl wget unzip \
    clang clang-tools \
    lsb-release software-properties-common gnupg

# Clangd
RUN apt-get install -y clangd-12 && \
    update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

# Download the llvm.sh script
RUN wget https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh all

# Install Neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
    rm -rf /opt/nvim && \
    tar -C /opt -xzf nvim-linux64.tar.gz && \
    rm nvim-linux64.tar.gz

ENV PATH="/opt/nvim-linux64/bin:${PATH}"

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim && \
    git clone https://github.com/Aguiar575/nvim /root/.config/nvim && \
    echo 'export PATH="/opt/nvim-linux64/bin:${PATH}"' >> /root/.bashrc && \
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && \
    nvim --headless -c ':TSUpdate' -c ':TSUpdateSync' -c 'q'

# Start a command that doesn't exit immediately
CMD ["tail", "-f", "/dev/null"]

