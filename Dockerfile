FROM ubuntu
LABEL Author="Leo Lin <leolin@leolin.studio>"

# Prevent dpkg errors
ENV TERM=xterm-256color

# set mirrors to cn
# RUN sed -i "s/http:\/\/archive./http:\/\/cn.archive./g" /etc/apt/sources.list

# Install Python Runtime
RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    # python \
    python3.7 \
    # python-virtualenv
    python3-venv \
    python3.7-venv \
    libpython3.7 \
    # install dev/build dependencies, libmysqlclient-dev is for avoiding can not find mysql_config error
    # python3.7-dev \
    # gcc \
    # libmysqlclient-dev
    python3-mysqldb

RUN python3.7 -m venv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade

# add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]