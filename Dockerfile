FROM codercom/code-server

LABEL maintainer="Luca Guzzon luca.guzzon@gmail.com"

USER root

ENTRYPOINT ["dumb-init", "code-server", "--host", "0.0.0.0", "--auth", "none"]
