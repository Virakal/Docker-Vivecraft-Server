FROM itzg/minecraft-server

ENV TYPE magma
ENV VERSION 1.12.2

# Download the Vivecraft Forge server extension to enable animations on the server side
COPY provision-plugins.sh /opt
RUN ["chmod", "+x", "/opt/provision-plugins.sh"]

ENTRYPOINT /opt/provision-plugins.sh && /start
