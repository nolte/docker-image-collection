FROM alpine-executer

ENV USERNAME=executer
ENV USER_UID=1000
ENV USER_GID=1000
ENV WORKON_HOME=/home/${USERNAME}/.virtualenvs

USER root

RUN echo "**** install Python ****" && \
    apk add --update-cache \
    sudo \
    && rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER ${USERNAME}

COPY --chown=${USER_UID}:${USER_GID} files/python-env-usage-ansible.txt /home/${USERNAME}/vens/python-env-usage-ansible.txt
#ARG WORKON_HOME=/home/${USERNAME}/.virtualenvs

RUN mkdir -p ${WORKON_HOME} \
    && virtualenv -p python3 ${WORKON_HOME}/usage-ansible \
    && source ${WORKON_HOME}/usage-ansible/bin/activate \
    && pip install -r /home/${USERNAME}/vens/python-env-usage-ansible.txt \
    && deactivate

RUN ls -all ${WORKON_HOME}

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["ansible","--version"]
