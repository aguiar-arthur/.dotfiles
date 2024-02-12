FROM --platform=linux/x86_64 ubuntu:latest

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    git luajit curl wget unzip make \
    clang clang-tools \
    lsb-release software-properties-common gnupg 

# Clangd
RUN apt-get install -y clangd-12 && \
    update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

# Download the llvm.sh script
RUN wget https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh all

# Install .NET
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x ./dotnet-install.sh && \
    ./dotnet-install.sh --version latest && \
    rm ./dotnet-install.sh && \
    echo 'export PATH=$PATH:/root/.dotnet:/root/.dotnet/tools"' >> /root/.bashrc

# Install pyenv
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y python3-openssl build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev \
    libffi-dev liblzma-dev 

RUN curl https://pyenv.run | bash
ENV PATH="/root/.pyenv/bin:$PATH"

RUN echo 'export PATH="/root/.pyenv/bin:$PATH"' >> /root/.bashrc && \
    echo 'eval "$(pyenv init --path)"' >> /root/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> /root/.bashrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

RUN eval "$(pyenv init --path)" && \
    pyenv install --list | grep -E '^  [0-9]+\.[0-9]+\.[0-9]+$' | tail -n 1 | xargs pyenv install && \
    pyenv global $(pyenv versions --bare)

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

RUN eval "$(pyenv init --path)" && \
    mkdir /root/virtualenvs && \
    cd /root/virtualenvs && \
    python -m venv debugpy && \
    ./debugpy/bin/python -m pip install debugpy

COPY variables.lua /root/.config/nvim/lua/arthur/variables.lua

# Start a command that doesn't exit immediately
CMD ["tail", "-f", "/dev/null"]

