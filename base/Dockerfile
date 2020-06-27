FROM alpine:3.12.0

ENV USERNAME=executer
ENV USER_UID=1000
ENV USER_GID=1000
ENV WORKON_HOME=/home/${USERNAME}/.virtualenvs

RUN adduser $USERNAME -s /bin/sh -D -u $USER_UID $USER_GID && \
    mkdir -p /etc/sudoers.d && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

RUN echo "**** install Python ****" && \
    apk add --update-cache \
    curl wget \
    boost-regex \
    sed \
    jq tar rsync unzip tree \
    bash \
    zip \
    libc6-compat python3 build-base python3-dev libffi libffi-dev openssl-dev \
    linux-headers gnupg openssl gcc build-base libc-dev musl-dev ca-certificates \
    && rm -rf /var/cache/apk/* && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel virtualenvwrapper virtualenv && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

USER ${USERNAME}
