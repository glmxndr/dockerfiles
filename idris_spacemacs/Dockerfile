FROM haskell:8.2

RUN stack install idris-1.3.0 --resolver lts-11.13

RUN apt-get update \
 && apt-get -y install \
        build-essential \
        pkg-config libffi-dev libgmp-dev \
        bash gzip make sudo tar unzip \
        tmux vim \
        git emacs25

# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE="1" \
    DEBIAN_FRONTEND="noninteractive" \
    HOME="/root" \
    WORKSPACE="/usr/src/lib" \
    SHELL="/bin/bash" \
    PATH="/bin/jdk/bin:/bin/idris-jvm/codegen/bin:/root/.cabal/bin:/root/.local/bin:/opt/cabal/2.2/bin:/opt/ghc/8.2.2/bin:${PATH}"

COPY ./.spacemacs ${HOME}

WORKDIR "${WORKSPACE}"

RUN cd /usr/lib \
 && git clone https://github.com/jfdm/idris-containers \
 && cd idris-containers \
 && idris --install containers.ipkg

RUN mkdir -p ${HOME}/.idris \
 && chmod -R 777 ${HOME}/.idris \
 && chmod 777 ${HOME}/.spacemacs \
 && chmod 777 ${HOME}

RUN git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro \
 && fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

CMD emacs
