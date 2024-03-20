FROM python:3.9
WORKDIR /sgsco
RUN apt-get update
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN mkdir -p /var/log/shotgun
RUN mkdir -p /usr/local/shotgun/plugins
COPY src/examplePlugins/logArgs.py /usr/local/shotgun/plugins
COPY src/shotgunEventDaemon.py /usr/local/bin
COPY etc/shotgunEventDaemon.conf /etc/
COPY src/daemonizer.py /usr/local/bin

CMD python3 /usr/local/bin/shotgunEventDaemon.py foreground
