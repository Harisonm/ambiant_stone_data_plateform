FROM eclipse-temurin:17-jre

ENV KESTRA_PLUGINS="io.kestra.plugin:plugin-notifications:LATEST \
                    io.kestra.storage:storage-gcs:LATEST \
                    io.kestra.plugin:plugin-gcp:LATEST \
                    io.kestra.plugin.gcp.cli.GCloudCLI:LATEST"
ARG APT_PACKAGES=""

WORKDIR /app
COPY docker /

RUN apt-get update -y && \
    apt-get upgrade -y && \
    if [ -n "${APT_PACKAGES}" ]; then apt-get install -y --no-install-recommends ${APT_PACKAGES}; fi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* && \
    if [ -n "${KESTRA_PLUGINS}" ]; then /app/kestra plugins install ${KESTRA_PLUGINS} && rm -rf /tmp/*; fi && \
    groupadd kestra && \
    useradd -m -g kestra kestra && \
    chown -R kestra:kestra /app
    
USER kestra

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["--help"]
