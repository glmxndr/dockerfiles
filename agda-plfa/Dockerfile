FROM haskell:8.6.5

# Install basic dependencies
RUN apt-get update \
 && apt-get install -y \
      build-essential cmake \
      ruby-dev ruby2.3-dev rubygems \ 
      vim tmux emacs25 \
      git \
      fonts-dejavu fonts-dejavu-extra \
 && apt-get autoremove \
 && rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*
 && gem install bundler

# Install source-code pro fonts (for spacemacs users)
RUN git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro \
 && fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

# Install Agda
RUN cabal update \
 && cabal install alex happy \
 && cabal install Agda

# Install agda-stdlib
RUN mkdir -p /usr/lib \
 && cd /usr/lib \
 && git clone https://github.com/agda/agda-stdlib.git \
 && cd agda-stdlib \
 && git checkout v1.1 \
 && mkdir -p $HOME/.agda \
 && touch $HOME/.agda/libraries \
 && echo "/usr/lib/agda-stdlib/standard-library.agda-lib" >> $HOME/.agda/libraries \
 && echo "standard-library" >> $HOME/.agda/defaults

# Download and build plfa
RUN mkdir /app \
 && cd /app \
 && git clone https://github.com/plfa/plfa.github.io/ \
 && cd plfa.github.io \
 && bundle install \
 && make build \
 && echo "/app/plfa.github.io/plfa.agda-lib" >> $HOME/.agda/libraries \
 && echo "plfa" >> $HOME/.agda/defaults

# Create links for a sometimes confused emacs
RUN ln -s /root/.cabal/bin/agda /usr/bin/agda \
 && ln -s /root/.cabal/bin/agda-mode /usr/bin/agda-mode \
 && ln -s /root/.cabal/bin/alex /usr/bin/alex \
 && ln -s /root/.cabal/bin/happy /usr/bin/happy

ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND noninteractive